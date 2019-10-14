extends Node2D

func _ready():
	root.set_screen_orientation(0)
	get_tree().set_auto_accept_quit(false)
	$Avatar.play(userModel.getUserAvatar())
	pass # Replace with function body.

#Testing only (Comment out otherwise)
func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST):
        root.return_to_last()