extends Button

func _ready():
	connect("pressed",self,"close_popup")
	pass 

func close_popup():
	print("pressed")
	get_parent().hide()
