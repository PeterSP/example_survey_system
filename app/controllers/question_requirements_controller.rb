class QuestionRequirementsController < ApplicationController
  # GET /question_requirements
  # GET /question_requirements.xml
  def index
    @question_requirements = QuestionRequirement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @question_requirements }
    end
  end

  # GET /question_requirements/1
  # GET /question_requirements/1.xml
  def show
    @question_requirement = QuestionRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question_requirement }
    end
  end

  # GET /question_requirements/new
  # GET /question_requirements/new.xml
  def new
    @question_requirement = QuestionRequirement.new
    @question_requirement.question_id = params[:id]

    @options = @question_requirement.question.survey.options

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question_requirement }
    end
  end

  # POST /question_requirements
  # POST /question_requirements.xml
  def create
    @question_requirement = QuestionRequirement.new(params[:question_requirement])

    respond_to do |format|
      if @question_requirement.save
        flash[:notice] = 'QuestionRequirement was successfully created.'
        format.html { redirect_to(@question_requirement) }
        format.xml  { render :xml => @question_requirement, :status => :created, :location => @question_requirement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /question_requirements/1
  # DELETE /question_requirements/1.xml
  def destroy
    @question_requirement = QuestionRequirement.find(params[:id])
    @question_requirement.destroy

    respond_to do |format|
      format.html { redirect_to(question_requirements_url) }
      format.xml  { head :ok }
    end
  end
end
