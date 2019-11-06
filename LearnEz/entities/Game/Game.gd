extends Node2D

func _ready():
	root.set_screen_orientation(0)
	get_tree().set_auto_accept_quit(false)
	
	print(levelModel.getLevelIDByIdx(levelModel.selectedLevelIdx))
	print(worldModel.getWorldIDbyIdx(worldModel.selectWorldIdx))
	
	loadQuestions()
	pass
	
func loadQuestions():
	var apiUrl = gameModel.getBaseURL() + levelModel.getLevelIDByIdx(levelModel.selectedLevelIdx) + "/" + worldModel.getWorldIDbyIdx(worldModel.selectWorldIdx)
	apiController.apiCallGet(apiUrl)
	
	yield(apiController, "request_completed")
	
	var result = apiController.getResult()
	gameModel.setQuestions(result)
	
	for question in gameModel.getQuestions():
		if(question['difficulty'] == '1'):
			gameModel.difficulty1.insert(gameModel.difficulty1.size(),question)
	
	print(gameModel.difficulty1)