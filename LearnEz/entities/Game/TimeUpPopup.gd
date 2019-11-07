extends Popup

func _ready():
	$bg.hide()
	connect("about_to_show",self,"playAni")
	pass 

func playAni():
	$gameOverAni.play("gameover")

func _on_gameOverAni_animation_finished():
	$bg.show()
	$gameOverAni.queue_free()
	pass #
