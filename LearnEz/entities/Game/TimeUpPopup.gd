extends Popup

func _ready():
	$bg.hide()
	connect("about_to_show",self,"playAni")
	
	$backToIsland.hide()
	$getHelp.hide()
	
	$backToIsland.connect("pressed",self,"backToLevel")
	$getHelp.connect("pressed",self,"getHelp")
	pass 

func playAni():
	$gameOverAni.play("gameover")

func _on_gameOverAni_animation_finished():
	$bg.show()
	$gameOverAni.queue_free()
	$backToIsland.show()
	$getHelp.show()
	pass 
	
func backToLevel():
	root.switch_scene("res://entities/Level/LevelController.tscn")
	
func getHelp():
	root.switch_scene("res://entities/Discussion/DiscussionBoardController.tscn")
