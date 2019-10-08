extends Node

func _ready():
	root.set_screen_orientation(0)
	get_tree().set_auto_accept_quit(false)
	$username_empty_label.hide()
	$password_empty_label.hide()
	$Loading_bg.hide()
	$Loading_sprite.hide()
	
	pass # Replace with function body.

	
func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST):
        root.return_to_last()
