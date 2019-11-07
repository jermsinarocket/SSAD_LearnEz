extends Popup


func _ready():
	connect("about_to_show",self,"loadCurrentQuestion")
	pass # Replace with function body.


func loadCurrentQuestion():
	get_parent().get_node("TimerPopup").popup()
	pass
