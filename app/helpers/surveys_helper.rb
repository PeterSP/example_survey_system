module SurveysHelper

  #The below two helpers (ab)use update_page in order to use the debugging code
  # that wraps it-- try { code } catch( e ) { alert(string(code)) }

  def add_question(f)
    update_page do |page|
      page<<'qid += 1;'
      page<<'new_question = "<li><label>Question</label> <input type=\"text\" size=\"30\" name=\"survey[questions_attributes]["+qid+"][question]\" id=\"survey_questions_attributes_"+qid+"_question\"><br /><label>Help</label> <input type=\"text\" size=\"30\" name=\"survey[questions_attributes]["+qid+"][help]\" id=\"survey_questions_attributes_"+qid+"_help\"><br /><a id=\"question_"+qid+"_link\" onclick=\"add_option("+qid+"); return false;\" href=\"#\">Add Option</a><ul id=\"question_"+qid+"\"></ul></li>";'
      page<<'$("questions").insert(new_question);'
      page.assign 'oids[qid]', 0
    end
  end

  def add_option( qf )
    update_page do |page|
      page<<'new_option = "<li><label>Value</label><br /><input type=\"text\" size=\"30\" id=\"survey_questions_attributes_"+qid+"_options_attributes_"+oids[qid]+"_value\" name=\"survey[questions_attributes]["+qid+"][options_attributes]["+oids[qid]+"][value]\" /></li>";'
      page<<'$("question_"+qid).insert(new_option);'
      page<<'oids[qid]+=1;'
    end
  end

  def observe_option( o, i )
    questions_to_show = o.questions_requiring
    questions_to_hide = []
    @survey.questions.each do |q|
      if ( q.options_required.count > 0) && (o.question.options.include? \
                                             q.options_required[0])
        unless o.questions_requiring.include? q
          questions_to_hide << q
        end
      end
    end

    if( (questions_to_show.size+questions_to_hide.size)>0 )
      func = update_page do |page|
        page<<'if(element.checked) {'
        questions_to_show.each do |q|
          page.show "question_#{q.id}"
        end
        questions_to_hide.each do |q|
          page.hide "question_#{q.id}"
        end
        page<<'}'
      end
      return observe_field "user_survey_responses_attributes_#{i}_option_id_#{o.id}", :function => func, :frequency => 0.1
    end
  end

  def answer_survey_path(survey)
    {:controller => :surveys, :action => :answer, :id =>survey.id}
  end
end
