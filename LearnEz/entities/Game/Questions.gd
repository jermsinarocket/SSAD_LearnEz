extends Popup

var enemy
var randomQuestionIdx
var currQuestion
var correctOption
var questions
 
func _ready():
	
	connect("about_to_show",self,"loadCurrentQuestion")
	for enemy in $Enemies.get_children():
		enemy.hide()
		
	for button in $questionOptions.get_children():
		button.connect("pressed",self,"handleSelectOption",[button])
		button.hide()
	pass 

func loadCurrentQuestion():
	
	for item in self.get_children():
		item.show()
		
	get_parent().get_node("TimerPopup").popup()
	
	loadEnemy()
	
	$avatarAni.play("avatar2")
	
	questions = gameModel.getQuestionsByDifficulty()
	randomize()
	randomQuestionIdx = int(rand_range(0,questions.size()))
	currQuestion = questions[randomQuestionIdx]
	correctOption = int(currQuestion["correctOption"])
	print("Correct Answer: " +  str(correctOption))
	setQuestionTitleTxt()
	setQuestionOptions()
	setQuestionSelectButtons()
	pass
	
func loadEnemy():
	randomize()
	var randomEnemyIndex = ceil(rand_range(-1, 2))
	
	for item in $Enemies.get_children():
		if(item.get_index() == randomEnemyIndex):
			enemy = item
			enemy.show()
			enemy.play("idle")
		else:
			item.hide()

func setQuestionTitleTxt():
	
	$questionTitleLbl.clear()
	$questionTitleLbl.append_bbcode("[center]" + currQuestion['questionTitle'])
	
func setQuestionOptions():
	for item in $questionOptionsLbl.get_children():
		var itemIdx = item.get_index()
		var optionNumber = "option" + str(itemIdx+1)
		item.clear()
		item.append_bbcode("[center]" + currQuestion[optionNumber])
	pass
	
func handleSelectOption(button):
	
	highlightCorrectOption()
	disableQuestionSelectButtons()
	
	gameModel.removeQuestionFromDifficulty(randomQuestionIdx)

	var selectedIdx = button.get_index()
	
	if(selectedIdx == correctOption):
		handleCorrect()
	else:
		handleWrong()
		
func setQuestionSelectButtons():
	for button in $questionOptions.get_children():
		button.show()
		button.set_block_signals(false)

func disableQuestionSelectButtons():
	for button in $questionOptions.get_children():
		button.set_block_signals(true)


func highlightCorrectOption():
	for button in $questionOptions.get_children():
		if(button.get_index() == correctOption):
			button.modulate = Color(0,1,0)
		else:
			button.modulate = Color(1,0,0)
		
func handleCorrect():
	enemy.play("down")
	gameModel.increaseDifficulty()
	resetAll()
	pass
	
func handleWrong():
	enemy.play("swing")
	gameModel.decreaseDifficulty()
	pass


func resetAll():
#	for button in $questionOptions.get_children():
#		if(button.get_index() == correctOption):
#			button.modulate = Color((255/255), (165/255), 0)
#		else:
#			button.modulate = Color((255/255), (165/255), 0)
#
	for item in self.get_children():
		item.hide()
