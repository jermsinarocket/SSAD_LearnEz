extends Sprite


func _ready():
	self.hide()
	$Close_Btn.connect("pressed",self,"on_button_pressed")
	pass # Replace with function body.

func on_button_pressed():
	get_parent().get_node("Reset_by_Email").hide()
	get_parent().get_node("Reset_by_ID").hide()
	self.hide()
