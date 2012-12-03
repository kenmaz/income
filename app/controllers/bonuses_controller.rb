class BonusesController < ApplicationController

  def list
    @highlight = params[:highlight]
    case @mode = params[:mode]
    when 'age'
      @age = params[:age]
      @bonuses = Bonus.find(:all, :conditions => ["age = ?", @age], :order => 'amount DESC')
    when 'company_name'
      @company_name = params[:company_name]
      @bonuses = Bonus.find(:all, :conditions => ["company_name = ?", @company_name], :order => 'amount DESC')
    else
      @bonuses = Bonus.find(:all, :order => 'amount DESC')
    end
  end

  def register 
    if params[:bonus]
      @bonus = Bonus.new(params[:bonus])
      if @bonus.save
        redirect_to :action => :list, :highlight => @bonus.id, :anchor => @bonus.id
      end
    else
      @bonus = Bonus.new
    end
  end

end
