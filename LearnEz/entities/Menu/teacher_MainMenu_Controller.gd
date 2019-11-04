extends Node2D

#Student Main Menu

func _ready():
	root.set_screen_orientation(0)
	get_tree().set_auto_accept_quit(false)
	$Settings.connect("pressed",self,"settings_pressed")
	$Assignment.connect("pressed",self,"assignment_pressed")
	$Performance_Report.connect("pressed",self,"performance_report_pressed")
	$Discussion_Board.connect("pressed",self,"discussion_board_pressed")
	pass 

#Testing only
func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST):
        root.return_to_last()

func assignment_pressed():
	root.switch_scene("res://entities/Settings/SettingsController.tscn")

func settings_pressed():
	root.switch_scene("res://entities/Settings/SettingsController.tscn")
	
func performance_report_pressed():
	root.switch_scene("res://entities/Settings/SettingsController.tscn")

func discussion_board_pressed():
	root.switch_scene("res://entities/Discussion/DiscussionBoardController.tscn")	