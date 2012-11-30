class BonusesController < ApplicationController
  # GET /bonuses
  # GET /bonuses.json
  def index
    @bonuses = Bonus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bonuses }
    end
  end

  # GET /bonuses/1
  # GET /bonuses/1.json
  def show
    @bonus = Bonus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bonus }
    end
  end

  # GET /bonuses/new
  # GET /bonuses/new.json
  def new
    @bonus = Bonus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bonus }
    end
  end

  # GET /bonuses/1/edit
  def edit
    @bonus = Bonus.find(params[:id])
  end

  # POST /bonuses
  # POST /bonuses.json
  def create
    @bonus = Bonus.new(params[:bonus])

    respond_to do |format|
      if @bonus.save
        format.html { redirect_to @bonus, notice: 'Bonus was successfully created.' }
        format.json { render json: @bonus, status: :created, location: @bonus }
      else
        format.html { render action: "new" }
        format.json { render json: @bonus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bonuses/1
  # PUT /bonuses/1.json
  def update
    @bonus = Bonus.find(params[:id])

    respond_to do |format|
      if @bonus.update_attributes(params[:bonus])
        format.html { redirect_to @bonus, notice: 'Bonus was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bonus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bonuses/1
  # DELETE /bonuses/1.json
  def destroy
    @bonus = Bonus.find(params[:id])
    @bonus.destroy

    respond_to do |format|
      format.html { redirect_to bonuses_url }
      format.json { head :no_content }
    end
  end
end
