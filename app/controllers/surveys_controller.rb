class SurveysController < ApplicationController

  # GET /surveys
  # GET /surveys.xml
  def index
    @surveys = Survey.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.xml
  def show
    @survey = Survey.find(params[:id], :include => :questions)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.xml
  def new
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id], :include => :questions)
  end

  # POST /surveys
  # POST /surveys.xml
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        flash[:notice] = 'Survey was successfully created.'
        format.html { redirect_to(@survey) }
        format.xml  { render :xml => @survey, :status => :created, :location => @survey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.xml
  def update
    @survey = Survey.find(params[:id])

    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        flash[:notice] = 'Survey was successfully updated.'
        format.html { redirect_to(@survey) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.xml
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
      format.xml  { head :ok }
    end
  end

  # GET /survey/1/answer
  def answer
    @survey = Survey.find(params[:id])

    @user_survey = UserSurvey.new
    @user_survey.survey=@survey
    @survey.questions.each do |q|
      if q.is_a? Question
        if q.is_a? MultipleChoiceQuestion
          @user_survey.responses<< Response.new(:question_id => q.id)
        elsif q.is_a? MultipleAnswerQuestion
          q.options.each do |o|
            @user_survey.responses << Response.new(:question_id => q.id, :option_id => o.id)
          end
        end
      end
    end
  end

  # POST /survey/1/respond
  def respond
    @survey = Survey.find(params[:id])

    @user_survey = UserSurvey.new(params[:user_survey])

    ## ##
    # Question Requirements Block
    ##
#    req = {}
#    scope = {}
#    res = {}
#    @user_survey.responses.each do |r|
#      res[r.question_id]=r.option_id
#      req[r.question_id]=Set.new
#      scope[r.question_id] = r.question.options_required[0].question_id \
#        unless r.question.options_required.count == 0
#      r.question.options_required.each do |o|
#        req[r.question_id]<< o.id
#      end
#    end
#    @user_survey.responses.each do |r|
#      if( (scope[r.question_id]) || \
#          !(req[r.question_id].include? res[scope[r.question_id]] ) )
#        @user_survey.responses.delete r
#      end
#    end
    ## ##

    respond_to do |format|
      if @user_survey.save
        flash[:notice] = 'Survey was successfully updated.'
        format.html { redirect_to(@survey) }
        format.xml  { head :ok }
      else
        format.html { render :action => "answer" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end
end
