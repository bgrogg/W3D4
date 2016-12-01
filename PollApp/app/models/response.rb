class Response < ActiveRecord::Base
  validate :respondent_already_answered?
  # validate :respondent_wrote_poll?

  belongs_to :answer_choice,
    foreign_key: :choice_id,
    primary_key: :id,
    class_name: "AnswerChoice"

  belongs_to :respondent,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: "User"

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where("responses.id != ?", self.id)
  end

  def respondent_already_answered?
    user = self.user_id
    sibling_responses.each do |response|
      if response.user_id == user
        errors[:already_answered] << "You've already answered this question"
        return false
      end
    end

    true
  end

  # def respondent_wrote_poll?
  #   if self.question.poll.author_id == self.user_id
  #     errors[:your_poll] << "You cannot answer your own poll!"
  #   end
  # end

end
