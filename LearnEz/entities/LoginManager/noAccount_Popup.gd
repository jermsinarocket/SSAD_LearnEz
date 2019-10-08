extends Sprite

func _ready():
	self.hide()
	$Close_Btn.connect("pressed",self, "close_popup")
	pass # Replace with function body.

func close_popup():
	self.hide()