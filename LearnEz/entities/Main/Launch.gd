extends Node

#Handle Launch Page
func _ready():
	root.set_screen_orientation(0)
	$to_Login_Btn.connect("pressed",self,"login_pressed")
	pass 
	
func login_pressed():
	root.switch_scene("res://entities/LoginManager/LoginController.tscn")