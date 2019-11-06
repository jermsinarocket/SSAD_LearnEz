extends Container

var Q5option1 = false
var Q5option2 = false
var Q5option3 = false
var Q5option4 = false

func _ready():
	self.hide()
	$Q5option1.connect("pressed",self,"option1_pressed")
	$Q5option2.connect("pressed",self,"option2_pressed")
	$Q5option3.connect("pressed",self,"option3_pressed")
	$Q5option4.connect("pressed",self,"option4_pressed")
	pass # Replace with function body.

func option1_pressed():
	if (Q5option1 == false):
		Q5option1 = true
		Q5option2 = false
		Q5option3 = false
		Q5option4 = false
		
func option2_pressed():
	if (Q5option2 == false):
		Q5option1 = false
		Q5option2 = true
		Q5option3 = false
		Q5option4 = false
		
func option3_pressed():
	if (Q5option3 == false):
		Q5option1 = false
		Q5option2 = false
		Q5option3 = true
		Q5option4 = false
		
func option4_pressed():
	if (Q5option4 == false):
		Q5option1 = false
		Q5option2 = false
		Q5option3 = false
		Q5option4 = true
		
func checkAnswered():
	return (Q5option1 or Q5option2 or Q5option3 or Q5option4)

func correctAnswer():
	if (Q5option1):
		return 0
	elif (Q5option2):
		return 1
	elif (Q5option3):
		return 2
	elif (Q5option4):
		return 3