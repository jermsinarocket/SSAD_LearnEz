extends Node2D

func _ready():
	root.set_screen_orientation(0)
	get_tree().set_auto_accept_quit(false)
	$Avatar.play(userModel.getUserAvatar())
	pass # Replace with function body.
	$ChangeAvatar_btn.connect('pressed',self,'renderAvatarPage')
	$logout_box.hide()
	$change_password_box.hide()
	$password_updated_box.hide()

	$name_1.clear()
	$name_1.append_bbcode("[center]" + userModel.getUserName() + '[/center]')
	
	$name_2.clear()
	$name_2.append_bbcode(userModel.getUserName())
	
	$userid.clear()
	$userid.append_bbcode(userModel.getUserId())
	
	$email.clear()
	$email.append_bbcode(userModel.getUserEmail())
	
	$userid_lbl.clear()
	$group.clear()
	$group.hide()
	$group_lbl.hide()
	
	$highest_stage_lbl.hide()
	$highest_stage.clear()
	$highest_stage.hide()
	
	$total_score_lbl.hide()
	$total_score.clear()
	$total_score.hide()
	
	if(userModel.getUserRole() == 'Student'):
		$userid_lbl.append_bbcode("Matric Number:")
		$userid.rect_position.x = 775.308
		
		$group_lbl.show()
		$group.show()
		$group.append_bbcode(userModel.getUserGroup())
		
		$highest_stage_lbl.show()
		$highest_stage.show()
		#$highest_stage.append_bbcode(userModel.getUserId())
		
		$total_score_lbl.show()
		$total_score.show()
		#$total_score.append_bbcode(userModel.getUserId())	
	else:
		$userid_lbl.append_bbcode("Staff ID:")
		$userid.rect_position.x = 648.851

	
func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST):
		if (userModel.getUserRole() == "Student"):
        	root.switch_scene("res://entities/Menu/Student_MainMenu_Controller.tscn")
		else:
			root.switch_scene("res://entities/Menu/Teacher_MainMenu_Controller.tscn")

func renderAvatarPage():
	root.switch_scene("res://entities/Settings/AvatarController.tscn")