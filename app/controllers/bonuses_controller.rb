class BonusesController < ApplicationController

  def list
    case params[:mode]
    when 'age'
      @bonuses = Bonus.find(:all, :conditions => ["age = ?", params[:age]], :order => 'amount DESC')
      @ranking_title = "#{params[:age]} years old's ranking"
    when 'company'
      @bonuses = Bonus.find(:all, :conditions => ["company_id = ?", params[:company_id]], :order => 'amount DESC')
      @ranking_title = "#{Company.find(:first, params[:company_id]).name}'s ranking"
    else
      @bonuses = Bonus.find(:all, :order => 'amount DESC')
      @ranking_title = "total-ranking"
    end
  end

  def register 
    if params[:bonus]
      if @bonus = Bonus.create(params[:bonus])
        redirect_to :action => :list
      end
    else
      @bonus = Bonus.new
      @bonus.company = Company.new
      @bonus.amount = 90 
      @bonus.age = 32
    end
  end

end
