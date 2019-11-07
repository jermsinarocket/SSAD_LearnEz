extends Node

var baseUrl = "question/"
var currDifficulty = 5
var allQuestions = [[],[],[],[],[],[],[],[],[],[]]

func setQuestions(questions):
	self.questions = questions

func getBaseURL():
	return self.baseUrl

func getQuestions():
	return self.questions
	
func setAllQuestionsByDifficulty(idx,question):
	allQuestions[idx].insert(allQuestions[idx].size(),question)
	
func getQuestionsByDifficulty():
	return (allQuestions[currDifficulty-1])

func removeQuestionFromDifficulty(idx):
	getQuestionsByDifficulty().remove(idx)
	
func increaseDifficulty():
	if(currDifficulty != 10):
		currDifficulty += 1

func decreaseDifficulty():
	if(currDifficulty != 1):
		currDifficulty -= 1
	
func resetDifficulty():
	currDifficulty = 5