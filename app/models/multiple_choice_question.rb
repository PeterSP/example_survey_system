class MultipleChoiceQuestion < Question
  has_many :responses

  def option_field( response_form, index, option_id )
    response_form.radio_button :option_id, option_id
  end
end
