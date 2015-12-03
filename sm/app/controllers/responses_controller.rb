class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # GET /responses
  # GET /responses.json
  def index
    @user = User.find(params[:user_id])
    @assignment = Assignment.where(user_id: @user.id).order(assignment_id: :asc)

    @responses = Response.where(user_id: @user.id).order(assignment_id: :asc)
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  def userlist
    @users = User.where(admin: false).order(name: :asc)

  end

  # GET /responses/new
  def new
    @assignment = Assignment.find(params[:assignment_id])
    @response = Response.new(assignment_id: @assignment.id)
    @user = current_user
    @presentation = Presentation.all.order("created_at desc").first
  end

  # GET /responses/1/edit
  def edit
    @user = current_user
    @assignment = Assignment.find(params[:assignment_id])
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)
    @user = current_user
    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:title, :content, :user_id, :assignment_id, :user_name)
    end
end
