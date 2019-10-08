extends RichTextLabel


func _ready():
	connect("meta_clicked", self, "_meta_clicked")
	pass # Replace with function body.

func _meta_clicked(meta):
	get_parent().get_node("Reset_by_Email").show()
	get_parent().get_node("Reset_by_ID").show()
	get_parent().get_node("Forget_Password_Popup").show()

