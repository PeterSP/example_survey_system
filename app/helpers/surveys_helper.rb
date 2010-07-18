module SurveysHelper

  #The below two helpers (ab)use update_page in order to use the debugging code
  # that wraps it-- try { code } catch( e ) { alert(string(code)) }

  def add_question(f)
    update_page do |page|
      page<<'new_question = "<li><label>Question</label> <input type=\"text\" size=\"30\" name=\"survey[questions_attributes]["+qid+"][question]\" id=\"survey_questions_attributes_"+qid+"_question\"><br /><label>Help</label> <input type=\"text\" size=\"30\" name=\"survey[questions_attributes]["+qid+"][help]\" id=\"survey_questions_attributes_"+qid+"_help\"><br /><a id=\"question_"+qid+"_link\" onclick=\"add_option("+qid+"); return false;\" href=\"#\">Add Option</a><ul id=\"question_"+qid+"\"></ul></li>";'
      page<<'$("questions").insert(new_question);'
      page.assign 'oids[qid]', 0
      page<<'qid += 1;'
    end
  end

  def add_option( qf )
    update_page do |page|
      page<<'new_option = "<li><label>Value</label><br /><input type=\"text\" size=\"30\" id=\"survey_questions_attributes_"+qid+"_options_attributes_"+oids[qid]+"_value\" name=\"survey[questions_attributes]["+qid+"][options_attributes]["+oids[qid]+"][value]\" /></li>";'
      page<<'$("question_"+qid).insert(new_option);'
      page<<'oids[qid]+=1;'
    end
  end

  def answer_survey_path(survey)
    {:controller => :surveys, :action => :answer, :id =>survey.id}
  end
end
