extends Node2D

onready var gameTimer = $TimerPopup/Timer
onready var Player = $Player

func _ready():
	root.set_screen_orientation(0)
	get_tree().set_auto_accept_quit(false)
	$TimerPopup/bg.modulate = Color(1,1,1,0.5)
	loadQuestions()
	$timePowerupQuantityLbl.clear()
	$timePowerupQuantityLbl.append_bbcode(userInventoryModel.getQuantityByIdx(1))
	$timePowerup.connect("pressed",self,"timeUp")
	pass

func loadQuestions():
	$Ready.play("ready")
	#var apiUrl = gameModel.getBaseURL() + levelModel.getLevelIDByIdx(levelModel.selectedLevelIdx) + "/" + worldModel.getWorldIDbyIdx(worldModel.selectWorldIdx)
	var apiUrl = gameModel.getBaseURL() + "5/World1" 
	apiController.apiCallGet(apiUrl)
	
	yield(apiController, "request_completed")
	
	for question in apiController.getResult():
		var difficulty = int(question['difficulty'])
		var idx = difficulty - 1
		gameModel.setAllQuestionsByDifficulty(idx,question)

	#gameModel.getQuestionsByDifficulty().remove(0)
	#print(gameModel.getQuestionsByDifficulty().size())
	#print(userInventoryModel.getQuantityByIdx(0))

func _on_Ready_animation_finished():
	$Ready.queue_free()
	$TimerPopup.popup()
	$TimerPopup/Timer/ms.start()
	Player.set_physics_process(true)
	pass 

func _on_Timer_no_time():
	
	$Questions.hide()
	gameTimer.set_process(false)
	$TimerPopup/Timer/ms.stop()
	$TimerPopup/bg.hide()

	$TimeUpPopup.popup()
	Player.set_physics_process(false)
	pass

func timeUp():
	if(userInventoryModel.getQuantityByIdx(1) == '0'):
		pass
	else:
		gameTimer.s += 20
		if(gameTimer.s >= 60):
			gameTimer.m += 1
			gameTimer.s -= 60
		userInventoryModel.reducePowerupQuantyByIdx(1)
		$timePowerupQuantityLbl.clear()
		$timePowerupQuantityLbl.append_bbcode(userInventoryModel.getQuantityByIdx(1))
	pass
	
func _on_Questions_popup_hide():
	if(gameModel.numQuestions == 0):
		Player.set_physics_process(false)
	pass
