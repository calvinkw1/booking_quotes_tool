class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

  # GET /inquiries
  # GET /inquiries.json
  def index
    @inquiries = Inquiry.all
  end

  # GET /inquiries/1
  # GET /inquiries/1.json
  def show
    # TODO: display logic for pricing breakdown
    #   breakdown already calculated in .cost_per_night method
  end

  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
    @units = Unit.all
  end

  # GET /inquiries/1/edit
  def edit
    @units = Unit.all
    @inquiry.calculate_cost_of_stay
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    @inquiry = Inquiry.new(inquiry_params)
    
    if @inquiry.valid? && @inquiry.errors.empty?
      @inquiry.calculate_cost_of_stay

      respond_to do |format|
        if @inquiry.save
          format.html { redirect_to @inquiry, notice: 'Inquiry was successfully created.' }
          format.json { render :show, status: :created, location: @inquiry }
        else
          @units = Unit.all
          format.html { render :new }
          format.json { render json: @inquiry.errors, status: :unprocessable_entity }
        end
      end
    else
      @units = Unit.all
      render :new
    end
  end

  # PATCH/PUT /inquiries/1
  # PATCH/PUT /inquiries/1.json
  def update
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @inquiry }
      else
        format.html { render :edit }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_url, notice: 'Inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.require(:inquiry).permit(:inquirer_name, :inquirer_email, :inquirer_phone, :check_in, :check_out, :nights, :price, :tax, :unit_id, :adults, :children, :pets, :rental_site )
    end
end
