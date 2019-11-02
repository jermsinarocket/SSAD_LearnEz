extends Node2D

var url = worldModel.getBaseUrl()
var result
var responseCode

func _ready():
	root.set_screen_orientation(0)
	get_tree().set_auto_accept_quit(false)
	$loading.popup()
	
	loadWorlds()
	for button in $WorldBackground.get_children():
		button.connect("pressed", self, "handleSelectWorld", [button])
	for locks in $WorldUnlockedStatus.get_children():
		locks.hide()
	for button in $WorldPlay.get_children():
		button.set_block_signals(true)
		button.hide()
	pass 

func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST):
        root.return_to_last()

func loadWorlds():
		var apiUrl = url + '/all' 
		apiController.apiCallGet(apiUrl)
		
		yield(apiController, "request_completed")

		result = apiController.getResult()
		responseCode = apiController.getResponseCode()
		worldModel.setWorlds(result)
		
		setWorldNames()
		
		apiController.apiCallGet("UserUnlockWorld/" + userModel.getUserId())
		yield(apiController, "request_completed")
		worldModel.setUnlockStatus(apiController.getResult())
		setUnlocked()
		
func setWorldNames():
	for titleText in $WorldTitlesText.get_children():
		titleText.clear()
		var titleString = "[center]" + worldModel.getWorldNameByIdx(titleText.get_index()) + "[/center]"
		titleText.append_bbcode(titleString)
		titleText.show()
		
func handleSelectWorld(button):
	worldModel.setSelectedWorld(button.name)
	worldModel.setSelectedWorldIdx(button.get_index())
	root.switch_scene("res://entities/Level/LevelController.tscn")

func setUnlocked():
	for locks in $WorldUnlockedStatus.get_children():
		var unlockStatus = worldModel.getWorldUnlockStatus(locks.get_index())
		$WorldScore.get_child(locks.get_index()).clear()
		if(unlockStatus == '0'):
			locks.show()
			($WorldBackground.get_child(locks.get_index())).set_block_signals(true)
		else:
			var worldScore = worldModel.getWorldScore(locks.get_index())
			if(worldScore != '0'):
				var scoreStr = "[center] Score: " + worldScore + "[/center]"
				$WorldScore.get_child(locks.get_index()).append_bbcode(scoreStr)
			else:
				$WorldPlay.get_child(locks.get_index()).show()
				$WorldPlay.get_child(locks.get_index()).set_block_signals(false)
			locks.queue_free()
			
	$loading.hide()
			