extends Node

#Handle Discussion Board Page

var apiUrl_discussion = "discussion/all"
var result_discussion
var responseCode_discussion
var base_index = 0
var max_index
var go_right = "true"
var number_to_minus

func _ready():
	root.set_screen_orientation(0)
	
	$discussion_1/discussion_id_1.hide()
	$discussion_2/discussion_id_2.hide()
	$discussion_3/discussion_id_3.hide()
	$discussion_4/discussion_id_4.hide()
	
	render_discussion()
	
	$NewDiscussion_Btn.connect("pressed",self,"new_discussion_pressed")
	$GoLeft_Btn.connect("pressed",self,"go_left_discussion_pressed")
	$GoRight_Btn.connect("pressed",self,"go_right_discussion_pressed")
	
	pass 

func render_discussion():
	
	$discussion_1/discussion_title_1.clear()
	$discussion_1/discussion_details_1.clear()
	$discussion_1/discussion_postedby_1.clear()
	$discussion_1/discussion_id_1.clear()
	
	$discussion_2/discussion_title_2.clear()
	$discussion_2/discussion_details_2.clear()
	$discussion_2/discussion_postedby_2.clear()
	$discussion_2/discussion_id_2.clear()
	
	$discussion_3/discussion_title_3.clear()
	$discussion_3/discussion_details_3.clear()
	$discussion_3/discussion_postedby_3.clear()
	$discussion_3/discussion_id_3.clear()
	
	$discussion_4/discussion_title_4.clear()
	$discussion_4/discussion_details_4.clear()
	$discussion_4/discussion_postedby_4.clear()
	$discussion_4/discussion_id_4.clear()

	apiController.apiCallGet(apiUrl_discussion)
	yield(apiController, "request_completed")
	
	result_discussion = apiController.getResult()
	responseCode_discussion = apiController.getResponseCode()
	
	max_index = result_discussion.size()
	number_to_minus = 4
	
	for i in range(1, 5):
		if (i == 1):
			
			if (base_index == max_index):
				
				go_right = "false"
				
			else:
				$discussion_1/discussion_title_1.append_bbcode(result_discussion[base_index]["title"])
				$discussion_1/discussion_details_1.append_bbcode(result_discussion[base_index]["details"])
				$discussion_1/discussion_postedby_1.append_bbcode("Posted By: ")
				$discussion_1/discussion_postedby_1.append_bbcode(result_discussion[base_index]["name"])
				$discussion_1/discussion_id_1.append_bbcode(result_discussion[base_index]["threadID"])
				
				base_index = base_index + 1
				number_to_minus = number_to_minus + 1
			
		if (i == 2):
			
			if (base_index == max_index):
				
				go_right = "false"
				
			else:
			
				$discussion_2/discussion_title_2.append_bbcode(result_discussion[base_index]["title"])
				$discussion_2/discussion_details_2.append_bbcode(result_discussion[base_index]["details"])
				$discussion_2/discussion_postedby_2.append_bbcode("Posted By: ")
				$discussion_2/discussion_postedby_2.append_bbcode(result_discussion[base_index]["name"])
				$discussion_2/discussion_id_2.append_bbcode(result_discussion[base_index]["threadID"])
				
				base_index = base_index + 1
				number_to_minus = number_to_minus + 1
			
		if (i == 3):
			
			if (base_index == max_index):
				
				go_right = "false"
				
			else:
			
				$discussion_3/discussion_title_3.append_bbcode(result_discussion[base_index]["title"])
				$discussion_3/discussion_details_3.append_bbcode(result_discussion[base_index]["details"])
				$discussion_3/discussion_postedby_3.append_bbcode("Posted By: ")
				$discussion_3/discussion_postedby_3.append_bbcode(result_discussion[base_index]["name"])
				$discussion_3/discussion_id_3.append_bbcode(result_discussion[base_index]["threadID"])
				
				base_index = base_index + 1
				number_to_minus = number_to_minus + 1
			
		if (i == 4):
			
			if (base_index == max_index):
				
				go_right = "false"
				
			else:
			
				$discussion_4/discussion_title_4.append_bbcode(result_discussion[base_index]["title"])
				$discussion_4/discussion_details_4.append_bbcode(result_discussion[base_index]["details"])
				$discussion_4/discussion_postedby_4.append_bbcode("Posted By: ")
				$discussion_4/discussion_postedby_4.append_bbcode(result_discussion[base_index]["name"])
				$discussion_4/discussion_id_4.append_bbcode(result_discussion[base_index]["threadID"])
				
				base_index = base_index + 1
				number_to_minus = number_to_minus + 1
				go_right = "true"
	
	if (base_index == max_index):
		go_right = "false"
				
	if (base_index <= 4):
		$GoLeft_Btn.hide()
	else:
		$GoLeft_Btn.show()
		
	if (go_right == "true"):
		$GoRight_Btn.show()
	else:
		$GoRight_Btn.hide()

func new_discussion_pressed():
	root.switch_scene("res://entities/Discussion/PostDiscussion.tscn")

func go_left_discussion_pressed():
	base_index = base_index - number_to_minus
	render_discussion()
	pass

func go_right_discussion_pressed():
	render_discussion()
	pass

func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST):
        root.return_to_last()