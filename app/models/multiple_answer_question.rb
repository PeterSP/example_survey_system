class MultipleAnswerQuestion < Question
  has_many :responses
  
  def option_field( response_form, index, option_id )
    response_form.check_box :checked, {}, true, false
  end
end
