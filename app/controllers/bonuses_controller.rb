class BonusesController < ApplicationController

  before_filter :setup_for_auth
  before_filter :sp_check

  def list
    limit = @is_registerd ? nil : 10
    @highlight = params[:highlight]
    case @mode = params[:mode]
    when 'age'
      @age = params[:age]
      @bonuses = Bonus.find(:all, :conditions => ["age = ?", @age], :order => 'income ASC', :limit => limit)
    when 'company_name'
      @company_name = params[:company_name]
      @bonuses = Bonus.find(:all, :conditions => ["company_name = ?", @company_name], :order => 'income ASC', :limit => limit)
    else
      @bonuses = Bonus.find(:all, :order => 'income ASC', :limit => limit)
    end
    @total_count = Bonus.count
  end

  def facebook_auth_callback
    session[:access_token] = @oauth.get_access_token(params[:code])
    redirect_to :action => :register
  end

  def logout
    session[:access_token] = nil
    session[:facebook_id] = nil
    redirect_to :action => :list
  end

  def register
    redirect_to @login_url unless @is_login

    graph = Koala::Facebook::API.new(session[:access_token])

    @user = graph.get_object("me")
    session[:facebook_id] = @user["id"].to_s

    @companies = []
    if work = @user["work"]
      work.each do |company|
        if emp = company["employer"]
          @companies << {
            :id => emp["id"],
            :name => emp["name"],
            :start_date => company["start_date"] || nil,
            :end_date => company["end_date"] || nil
          } 
        end
      end
    end 
 
    if params[:bonus]
      @bonus = Bonus.new(params[:bonus])
      @bonus.facebook_id = session[:facebook_id]
      if @bonus.save
        redirect_to :action => :list, :highlight => @bonus.id, :anchor => @bonus.id
      end
    else
      @bonus = Bonus.new

      birthday = Date.parse(@user["birthday"])
      @bonus.age = (default_age = (DateTime.now - birthday) / 365.25).to_i
      @bonus.company_name = @companies[0][:name] unless @companies.empty?
    end
  end

  private
  def setup_for_auth
    @oauth = Koala::Facebook::OAuth.new(FACEBOOK_APP_ID, FACEBOOK_SECRET, FACEBOOK_CALLBACK)
    @login_url = @oauth.url_for_oauth_code(:permissions => "user_birthday")
    @is_login = session[:access_token] != nil
    if fbid = session[:facebook_id]
      @is_registerd = Bonus.find_by_facebook_id(fbid)
    end
  end
  
  def sp_check
    ua = request.env["HTTP_USER_AGENT"]
    if(ua.include?('Mobile') || ua.include?('Android'))
      @sp = true
    end
  end
 
end
