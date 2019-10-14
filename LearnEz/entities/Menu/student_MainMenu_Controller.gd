extends Node2D

func _ready():
	root.set_screen_orientation(0)
	get_tree().set_auto_accept_quit(false)
	$playgame.connect("pressed",self,"playgame_pressed")
	$usercreations.connect("pressed",self,"usercreations_pressed")
	$assignments.connect("pressed",self,"assignments_pressed")
	$leaderboard.connect("pressed",self,"leaderboard_pressed")
	$discussionboard.connect("pressed",self,"discussionboard_pressed")
	$settings.connect("pressed",self,"settings_pressed")
	pass 

#Testing only (Comment out otherwise)
#func _notification(what):
#    if (what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST):
#        root.return_to_last()


func playgame_pressed():
	print("playgame")
	

func usercreations_pressed():
	print("usercreations")
	

func assignments_pressed():
	print("assignments")
	

func leaderboard_pressed():
	print("leaderboard")
	

func discussionboard_pressed():
	print("discussionboard")	
	

func settings_pressed():
	root.switch_scene("res://entities/Settings/SettingsController.tscn")