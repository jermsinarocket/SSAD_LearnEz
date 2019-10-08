extends TouchScreenButton


func _ready():
	self.connect("pressed",self, "reset_password")
	pass # Replace with function body.

func reset_password():
	get_parent().hide()
	print("Password Reset")