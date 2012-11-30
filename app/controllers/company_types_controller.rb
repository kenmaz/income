class CompanyTypesController < ApplicationController
  # GET /company_types
  # GET /company_types.json
  def index
    @company_types = CompanyType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @company_types }
    end
  end

  # GET /company_types/1
  # GET /company_types/1.json
  def show
    @company_type = CompanyType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company_type }
    end
  end

  # GET /company_types/new
  # GET /company_types/new.json
  def new
    @company_type = CompanyType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company_type }
    end
  end

  # GET /company_types/1/edit
  def edit
    @company_type = CompanyType.find(params[:id])
  end

  # POST /company_types
  # POST /company_types.json
  def create
    @company_type = CompanyType.new(params[:company_type])

    respond_to do |format|
      if @company_type.save
        format.html { redirect_to @company_type, notice: 'Company type was successfully created.' }
        format.json { render json: @company_type, status: :created, location: @company_type }
      else
        format.html { render action: "new" }
        format.json { render json: @company_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /company_types/1
  # PUT /company_types/1.json
  def update
    @company_type = CompanyType.find(params[:id])

    respond_to do |format|
      if @company_type.update_attributes(params[:company_type])
        format.html { redirect_to @company_type, notice: 'Company type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_types/1
  # DELETE /company_types/1.json
  def destroy
    @company_type = CompanyType.find(params[:id])
    @company_type.destroy

    respond_to do |format|
      format.html { redirect_to company_types_url }
      format.json { head :no_content }
    end
  end
end
