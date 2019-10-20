extends TouchScreenButton


func _ready():
	self.connect("pressed",self, "reset_password")
	pass # Replace with function body.

func reset_password():
	get_parent().hide()
	get_parent().get_parent().get_node("Reset_by_ID").hide()
	get_parent().get_parent().get_node("Reset_by_Email").hide()
	print("Password Reset")