extends Node

var baseUrl = "question/"
var questions
var diffuculty = 5
var difficulty1 = []

func setQuestions(questions):
	self.questions = questions

func getBaseURL():
	return self.baseUrl

func getQuestions():
	return self.questions