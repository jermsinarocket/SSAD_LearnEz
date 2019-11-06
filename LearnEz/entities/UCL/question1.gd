extends Container

var Q1option1 = false
var Q1option2 = false
var Q1option3 = false
var Q1option4 = false

func _ready():
	self.hide()
	$Q1option1.connect("pressed",self,"option1_pressed")
	$Q1option2.connect("pressed",self,"option2_pressed")
	$Q1option3.connect("pressed",self,"option3_pressed")
	$Q1option4.connect("pressed",self,"option4_pressed")
	pass # Replace with function body.

func option1_pressed():
	if (Q1option1 == false):
		Q1option1 = true
		Q1option2 = false
		Q1option3 = false
		Q1option4 = false
		
func option2_pressed():
	if (Q1option2 == false):
		Q1option1 = false
		Q1option2 = true
		Q1option3 = false
		Q1option4 = false
		
func option3_pressed():
	if (Q1option3 == false):
		Q1option1 = false
		Q1option2 = false
		Q1option3 = true
		Q1option4 = false
		
func option4_pressed():
	if (Q1option4 == false):
		Q1option1 = false
		Q1option2 = false
		Q1option3 = false
		Q1option4 = true
		
func checkAnswered():
	return (Q1option1 or Q1option2 or Q1option3 or Q1option4)
	
func correctAnswer():
	if (Q1option1):
		return 0
	elif (Q1option2):
		return 1
	elif (Q1option3):
		return 2
	elif (Q1option4):
		return 3