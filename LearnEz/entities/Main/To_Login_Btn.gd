extends TouchScreenButton

func _ready():
	connect("pressed",self,"_login_pressed")

func _login_pressed():
	root.switch_scene("res://entities/LoginManager/LoginController.tscn")