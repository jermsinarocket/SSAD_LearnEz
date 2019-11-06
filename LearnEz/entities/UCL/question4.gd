extends Container

var Q4option1 = false
var Q4option2 = false
var Q4option3 = false
var Q4option4 = false

func _ready():
	self.hide()
	$Q4option1.connect("pressed",self,"option1_pressed")
	$Q4option2.connect("pressed",self,"option2_pressed")
	$Q4option3.connect("pressed",self,"option3_pressed")
	$Q4option4.connect("pressed",self,"option4_pressed")
	pass # Replace with function body.

func option1_pressed():
	if (Q4option1 == false):
		Q4option1 = true
		Q4option2 = false
		Q4option3 = false
		Q4option4 = false
		
func option2_pressed():
	if (Q4option2 == false):
		Q4option1 = false
		Q4option2 = true
		Q4option3 = false
		Q4option4 = false
		
func option3_pressed():
	if (Q4option3 == false):
		Q4option1 = false
		Q4option2 = false
		Q4option3 = true
		Q4option4 = false
		
func option4_pressed():
	if (Q4option4 == false):
		Q4option1 = false
		Q4option2 = false
		Q4option3 = false
		Q4option4 = true
		
func checkAnswered():
	return (Q4option1 or Q4option2 or Q4option3 or Q4option4)

func correctAnswer():
	if (Q4option1):
		return 0
	elif (Q4option2):
		return 1
	elif (Q4option3):
		return 2
	elif (Q4option4):
		return 3