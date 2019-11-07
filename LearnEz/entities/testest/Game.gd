extends Node2D

func _ready():
	
	root.set_screen_orientation(0)
	get_tree().set_auto_accept_quit(false)

	gameModel.resetDifficulty()
	loadQuestions()
	pass
	
func loadQuestions():
	
	var apiUrl = gameModel.getBaseURL() + levelModel.getLevelIDByIdx(levelModel.selectedLevelIdx) + "/" + worldModel.getWorldIDbyIdx(worldModel.selectWorldIdx)
	apiController.apiCallGet(apiUrl)
	
	yield(apiController, "request_completed")
	
	for question in apiController.getResult():
		var difficulty = int(question['difficulty'])
		var idx = difficulty - 1
		gameModel.setAllQuestionsByDifficulty(idx,question)
	
	#print(gameModel.getQuestionsByDifficulty().size())
	#gameModel.getQuestionsByDifficulty().remove(0)
	#print(gameModel.getQuestionsByDifficulty().size())
	print(userInventoryModel.getQuantityByIdx(0))
	$Timer/ms.start()

func _on_Timer_no_time():
	$Timer.set_process(false)
	$Timer/ms.stop()
	var noTimeBg = Sprite.new()
	var noTimeIcon = preload("res://images/timesUp.png")
	var scale = Vector2(0.4, 0.4)
	noTimeBg.set_texture(noTimeIcon)
	noTimeBg.set_scale(scale)
	noTimeBg.position.x = 499.059
	noTimeBg.position.y = 65.183
	self.add_child(noTimeBg)
	pass
