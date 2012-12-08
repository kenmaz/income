class BonusesController < ApplicationController

  before_filter :setup_for_auth

  def list
    limit = @is_login ? nil : 10
    @highlight = params[:highlight]
    case @mode = params[:mode]
    when 'age'
      @age = params[:age]
      @bonuses = Bonus.find(:all, :conditions => ["age = ?", @age], :order => 'amount ASC', :limit => limit)
    when 'company_name'
      @company_name = params[:company_name]
      @bonuses = Bonus.find(:all, :conditions => ["company_name = ?", @company_name], :order => 'amount ASC', :limit => limit)
    else
      @bonuses = Bonus.find(:all, :order => 'amount ASC', :limit => limit)
    end
  end

  def facebook_auth_callback
    session[:access_token] = @oauth.get_access_token(params[:code])
    redirect_to :action => :register
  end

  def logout
    session[:access_token] = nil
    redirect_to :action => :list
  end

  def register
    redirect_to @login_url unless @is_login

    graph = Koala::Facebook::API.new(session[:access_token])

    @user = graph.get_object("me")

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
  end
   
end
