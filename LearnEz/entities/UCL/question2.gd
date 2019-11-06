extends Container

var Q2option1 = false
var Q2option2 = false
var Q2option3 = false
var Q2option4 = false

func _ready():
	self.hide()
	$Q2option1.connect("pressed",self,"option1_pressed")
	$Q2option2.connect("pressed",self,"option2_pressed")
	$Q2option3.connect("pressed",self,"option3_pressed")
	$Q2option4.connect("pressed",self,"option4_pressed")
	pass # Replace with function body.

func option1_pressed():
	if (Q2option1 == false):
		Q2option1 = true
		Q2option2 = false
		Q2option3 = false
		Q2option4 = false
		
func option2_pressed():
	if (Q2option2 == false):
		Q2option1 = false
		Q2option2 = true
		Q2option3 = false
		Q2option4 = false
		
func option3_pressed():
	if (Q2option3 == false):
		Q2option1 = false
		Q2option2 = false
		Q2option3 = true
		Q2option4 = false
		
func option4_pressed():
	if (Q2option4 == false):
		Q2option1 = false
		Q2option2 = false
		Q2option3 = false
		Q2option4 = true

func checkAnswered():
	return (Q2option1 or Q2option2 or Q2option3 or Q2option4)

func correctAnswer():
	if (Q2option1):
		return 0
	elif (Q2option2):
		return 1
	elif (Q2option3):
		return 2
	elif (Q2option4):
		return 3