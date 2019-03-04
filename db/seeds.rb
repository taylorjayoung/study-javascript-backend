# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Taylor", email: "t@gmail.org", username: "TheMIghtyTee", password: "p@sswired", admin: true)
User.create(name: "Gary", email: "gary@gmail.org", username: "GP", password: "pass")

Question.create(title: "q1", questionText: "some q", private: true, answerText: "some a", user_id: 1)
Question.create(title: "q2", questionText: "some q", answerText: "some a", user_id: 1)
Question.create(title: "q3", questionText: "some q", answerText: "some a", user_id: 1)
Question.create(title: "q4", questionText: "some q", answerText: "some a", user_id: 2)
Question.create(title: "q5", questionText: "some q", answerText: "some a", user_id: 2)
Question.create(title: "q6", questionText: "some q", answerText: "some a", user_id: 2)
Question.create(title: "q7", questionText: "some q", answerText: "some a", user_id: 2)

Category.create(title: "Recursion")
Category.create(title: "Syntax")
Category.create(title: "React")
Category.create(title: "CSS")
Category.create(title: "Closures")

Collection.create(title: "My Study Cards", private: true, user_id: 1)
Collection.create(title: "My Interview Prep", user_id: 1)
Collection.create(title: "Mine", private: true, user_id: 2)
Collection.create(title: "Mine2", user_id: 2)

Comment.create(message: "I don't think this is correct", question_id: 1, user_id: 1)
Comment.create(message: "I love this problem", question_id: 2, user_id: 1)
Comment.create(message: "Great point", question_id: 2, user_id: 1)
Comment.create(message: "Awesome", question_id: 2, user_id: 1)
Comment.create(message: "Coool", question_id: 2, user_id: 1)
Comment.create(message: "Great", question_id: 2, user_id: 1)
Comment.create(message: "Thanks", question_id: 2, user_id: 2)
Comment.create(message: "Coool", question_id: 3, user_id: 1)
Comment.create(message: "Coool", question_id: 4, user_id: 2)
Comment.create(message: "Coool", question_id: 5, user_id: 2)
Comment.create(message: "Coool", question_id: 6, user_id: 2)
Comment.create(message: "Coool", question_id: 7, user_id: 2)


QuestionsCollection.create(question_id: 1, collection_id: 1)
QuestionsCollection.create(question_id: 2, collection_id: 1)
QuestionsCollection.create(question_id: 3, collection_id: 1)
QuestionsCollection.create(question_id: 4, collection_id: 1)
QuestionsCollection.create(question_id: 5, collection_id: 2)
QuestionsCollection.create(question_id: 6, collection_id: 2)
QuestionsCollection.create(question_id: 7, collection_id: 2)
QuestionsCollection.create(question_id: 1, collection_id: 2)


QuestionsCategory.create(question_id: 1, category_id: 2)
QuestionsCategory.create(question_id: 2, category_id: 3)
QuestionsCategory.create(question_id: 3, category_id: 4)
QuestionsCategory.create(question_id: 4, category_id: 5)
QuestionsCategory.create(question_id: 5, category_id: 5)
QuestionsCategory.create(question_id: 7, category_id: 4)
QuestionsCategory.create(question_id: 6, category_id: 3)
QuestionsCategory.create(question_id: 1, category_id: 6)
