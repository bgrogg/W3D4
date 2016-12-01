# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ActiveRecord::Base.transaction do

  User.destroy_all
  user1 = User.create(:user_name => "CJ")
  user2 = User.create(:user_name => "Flarnie")
  user3 = User.create(:user_name => "Jeff")
  user4 = User.create(:user_name => "Georges St. Pierre")
  user5 = User.create(:user_name => "Ned")

  Poll.destroy_all
  Poll.create(:title => "Lunch Choices", :author_id => "3")
  Poll.create(:title => "Favorite Animals", :author_id => "5")
  Poll.create(:title => "Best GOT Character", :author_id => "4")


  Question.destroy_all
  Question.create(:text => "Where would you like to go for lunch?", :poll_id => "1")
  Question.create(:text => "What is your favorite animal?", :poll_id => "2")
  Question.create(:text => "Who is the best GOT character?", :poll_id => "3")

  AnswerChoice.destroy_all
  AnswerChoice.create(:text => "Ferry Building", :question_id => "1")
  AnswerChoice.create(:text => "Dumpster around the corner", :question_id => "1")
  AnswerChoice.create(:text => "Vending machine", :question_id => "1")

  AnswerChoice.create(:text => "Koala", :question_id => "2")
  AnswerChoice.create(:text => "Camel", :question_id => "2")
  AnswerChoice.create(:text => "Snake", :question_id => "2")

  AnswerChoice.create(:text => "Tyrion Lannister", :question_id => "3")
  AnswerChoice.create(:text => "Bronn", :question_id => "3")
  AnswerChoice.create(:text => "Jaime Lannister", :question_id => "3")

  Response.destroy_all

  Response.create(:choice_id => "1", :user_id => "1")
  Response.create(:choice_id => "5", :user_id => "1")
  Response.create(:choice_id => "9", :user_id => "1")

  Response.create(:choice_id => "3", :user_id => "5")
  Response.create(:choice_id => "5", :user_id => "5")
  Response.create(:choice_id => "8", :user_id => "5")
end
