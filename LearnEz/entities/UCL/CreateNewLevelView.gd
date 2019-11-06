extends Node2D

var url = "ucl"
var result_UCL
var responseCode_UCL

func _ready():
	$nextStep.connect("pressed", self, "nextStep_pressed")
	$create.connect("pressed", self, "create_pressed")
	$Q1.connect("pressed",self,"Q1_pressed")
	$Q2.connect("pressed",self,"Q2_pressed")
	$Q3.connect("pressed",self,"Q3_pressed")
	$Q4.connect("pressed",self,"Q4_pressed")
	$Q5.connect("pressed",self,"Q5_pressed")
	get_node("enterAnswer").hide()
	get_node("create").hide()
	get_node("Q1").hide()
	get_node("Q2").hide()
	get_node("Q3").hide()
	get_node("Q4").hide()
	get_node("Q5").hide()

	pass

func nextStep_pressed():
	if (get_node("uclDesc").text != "") and (get_node("uclLevel").text != ""):
		get_node("enterLevel").hide()
		get_node("enterDesc").hide()
		get_node("uclDesc").hide()
		get_node("uclLevel").hide()
		get_node("enterAnswer").show()
		get_node("create").show()
		get_node("Q1").show()
		get_node("Q2").show()
		get_node("Q3").show()
		get_node("Q4").show()
		get_node("Q5").show()
		create_pressed()
	else:
		get_node("errorPopup").show()

func create_pressed():

	if ((get_node("question1/Q1ans1").text == "") or
	(get_node("question1/Q1ans2").text == "") or 
	(get_node("question1/Q1ans3").text == "") or
	(get_node("question1/Q1ans4").text == "") or
	(get_node("question1/Q1").text == "") or
	(!get_node("question1").checkAnswered())):
		Q1_pressed()
		get_node("errorPopup").show()

	elif ((get_node("question2/Q2ans1").text == "") or
	(get_node("question2/Q2ans2").text == "") or 
	(get_node("question2/Q2ans3").text == "") or
	(get_node("question2/Q2ans4").text == "") or
	(get_node("question2/Q2").text == "") or
	(!get_node("question2").checkAnswered())):
		Q2_pressed()
		get_node("errorPopup").show()

	elif ((get_node("question3/Q3ans1").text == "") or
	(get_node("question3/Q3ans2").text == "") or 
	(get_node("question3/Q3ans3").text == "") or
	(get_node("question3/Q3ans4").text == "") or
	(get_node("question3/Q3").text == "") or
	(!get_node("question3").checkAnswered())):
		Q3_pressed()
		get_node("errorPopup").show()

	elif ((get_node("question4/Q4ans1").text == "") or
	(get_node("question4/Q4ans2").text == "") or 
	(get_node("question4/Q4ans3").text == "") or
	(get_node("question4/Q4ans4").text == "") or
	(get_node("question4/Q4").text == "") or
	(!get_node("question4").checkAnswered())):
		Q4_pressed()
		get_node("errorPopup").show()

	elif ((get_node("question5/Q5ans1").text == "") or
	(get_node("question5/Q5ans2").text == "") or 
	(get_node("question5/Q5ans3").text == "") or
	(get_node("question5/Q5ans4").text == "") or
	(get_node("question5/Q5").text == "") or
	(!get_node("question5").checkAnswered())):
		Q5_pressed()
		get_node("errorPopup").show()

	else:
		print("POSTING UCL!!!")
		var user_id = userModel.getUserId()

		var name = $uclLevel.get_text()
		var desc = $uclDesc.get_text()
		apiController.apiCallGet("ucl/all/all")
		yield(apiController, "request_completed")
		result_UCL = apiController.getResult()
		responseCode_UCL = apiController.getResponseCode()
		var totalSize = result_UCL.size()
		print(totalSize)
		
		var uclId = int(result_UCL[totalSize-1]["uclID"]) + 1
		var question1 = $question1/Q1.get_text()
		var ans1 = $question1/Q1ans1.get_text()
		var ans2 = $question1/Q1ans2.get_text()
		var ans3 = $question1/Q1ans3.get_text()
		var ans4 = $question1/Q1ans4.get_text()
		

		var correctAns = get_node("question1").correctAnswer()

		var data = {"uclID":uclId, "questionId":"1", "uclName":name, "uclDesc":desc, "questionTitle":question1, "option1":ans1, "option2":ans2, "option3":ans3, "option4":ans4, "correctOption":correctAns}
		apiController.apiCallPost(data,'ucl/1')


		yield(apiController, "request_completed")
		
		var result = apiController.getResult()
		var responseCode = apiController.getResponseCode()
		print("RESPONSE CODE: " + String(responseCode))
		print ("uclID: " + String(uclId) + "\nquestionId: 1" + "\nuclName: " + String(name) + "\nuclDesc: " + String(desc) + "\nquestionTitle: " + String(question1) + "\noption1: " + String(ans1) + "\noption2: " + String(ans2) + "\noption3: " + String(ans3) + "\noption4: " + String(ans4) + "\ncorrectOption: " + String(correctAns))


func Q1_pressed():
	get_node("question1").show()
	get_node("question2").hide()
	get_node("question3").hide()
	get_node("question4").hide()
	get_node("question5").hide()
	
func Q2_pressed():
	get_node("question1").hide()
	get_node("question2").show()
	get_node("question3").hide()
	get_node("question4").hide()
	get_node("question5").hide()
	
func Q3_pressed():
	get_node("question1").hide()
	get_node("question2").hide()
	get_node("question3").show()
	get_node("question4").hide()
	get_node("question5").hide()
	
func Q4_pressed():
	get_node("question1").hide()
	get_node("question2").hide()
	get_node("question3").hide()
	get_node("question4").show()
	get_node("question5").hide()
	
func Q5_pressed():
	get_node("question1").hide()
	get_node("question2").hide()
	get_node("question3").hide()
	get_node("question4").hide()
	get_node("question5").show()