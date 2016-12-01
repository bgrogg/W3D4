class AnswerChoice < ActiveRecord::Base
  validates :text, presence: true, uniqueness: true


  belongs_to :question,
    foreign_key: :question_id,
    primary_key: :id,
    class_name: "Question"

  has_many :responses,
    foreign_key: :choice_id,
    primary_key: :id,
    class_name: "Response"

end
