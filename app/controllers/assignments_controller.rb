class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /assignments
  # GET /assignments.json
  def index
    @presentation = Presentation.current
    unless @presentation.nil?
      @assignments = Assignment.where(presentation_id: @presentation.id)
    end
    @assignment = Assignment.new

  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = Assignment.find(params[:id])
  end

  def responselist
      @assignment = Assignment.find(params[:id])
      if sort_column.nil?
        @response = Response.where(assignment_id: @assignment.id).order("user_name" + " " + "asc")
      else
        @response = Response.where(assignment_id: @assignment.id).order(sort_column + " " + sort_direction)
      end
      @no_response = User.where.not(id: @response.pluck(:user_id)).where(admin: false)
      respond_to do |format|
        format.html
        format.csv {send_data @assignment.as_csv, :filename=>@assignment.discussion_title+".csv"}
      end
  end

  # GET /assignments/new
  def new
    @presentation = Presentation.current
    @assignment = Assignment.new
  end

  # GET /assignments/1/edit
  def edit
    @presentation = @assignment.presentation
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)
    @presentation = Presentation.current

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to :back, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to presentation_path(@assignment.presentation_id), notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Question was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def sort_column
    Response.where(assignment_id: @assignment.id).column_names.include?(params[:sort]) ? params[:sort] : "user_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end


    def assignment_params
      params.require(:assignment).permit(:discussion_title, :due_date, :discussion_question, :edit_question, :presentation_id, :slide_number)
    end
end
