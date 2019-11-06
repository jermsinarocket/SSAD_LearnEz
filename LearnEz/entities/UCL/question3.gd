extends Container

var Q3option1 = false
var Q3option2 = false
var Q3option3 = false
var Q3option4 = false

func _ready():
	self.hide()
	$Q3option1.connect("pressed",self,"option1_pressed")
	$Q3option2.connect("pressed",self,"option2_pressed")
	$Q3option3.connect("pressed",self,"option3_pressed")
	$Q3option4.connect("pressed",self,"option4_pressed")
	pass # Replace with function body.

func option1_pressed():
	if (Q3option1 == false):
		Q3option1 = true
		Q3option2 = false
		Q3option3 = false
		Q3option4 = false
		
func option2_pressed():
	if (Q3option2 == false):
		Q3option1 = false
		Q3option2 = true
		Q3option3 = false
		Q3option4 = false
		
func option3_pressed():
	if (Q3option3 == false):
		Q3option1 = false
		Q3option2 = false
		Q3option3 = true
		Q3option4 = false
		
func option4_pressed():
	if (Q3option4 == false):
		Q3option1 = false
		Q3option2 = false
		Q3option3 = false
		Q3option4 = true

func checkAnswered():
	return (Q3option1 or Q3option2 or Q3option3 or Q3option4)

func correctAnswer():
	if (Q3option1):
		return 0
	elif (Q3option2):
		return 1
	elif (Q3option3):
		return 2
	elif (Q3option4):
		return 3