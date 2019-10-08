extends TouchScreenButton

var url = userModel.getBaseUrl()
var result
var usernameLabel
var passwordLabel 
var loading_bg
var loading_sprite

func _ready():
	usernameLabel = get_parent().get_node("username_empty_label")
	passwordLabel = get_parent().get_node("password_empty_label")
	loading_bg = get_parent().get_node("Loading_bg")
	loading_sprite = get_parent().get_node("Loading_sprite")
	connect("pressed",self,"verifyUser")

func verifyUser():

	var login_val = get_parent().get_node("Login_Input").text
	var pass_val = get_parent().get_node("Password_Input").text

	if(login_val == ""):
		usernameLabel.show()
	else:
		usernameLabel.hide()

	if (pass_val == ""):
		passwordLabel.show()
	else:
		passwordLabel.hide()

	if(login_val != "" && pass_val != ""):
		
		#loading_bg.show()
		#loading_sprite.show()
		
		usernameLabel.hide()
		passwordLabel.hide()

		var apiUrl = url + '/' + login_val + '/' + pass_val
		apiController.apiCallGet(apiUrl)
		
		yield(apiController, "request_completed")

		result = apiController.getResult()

		if(result['status'] == 200):
			getUserInfo(login_val)
		else:			
			loading_bg.hide()
			loading_sprite.hide()
			get_parent().get_node("NoAccount_Popup").show()


func getUserInfo(login_val):

	var apiUrl = url + '/' + login_val
	
	apiController.apiCallGet(apiUrl) 
	
	yield(apiController, "request_completed")
	
	result = apiController.getResult()

	loading_bg.hide()
	loading_sprite.hide()
	
	userModel.setUserID(result['userID'])
	userModel.setEmail(result['email'])
	userModel.setPassword(result['password'])
	userModel.setUserRole(result['role'])

	if(userModel.getUserRole() == "Student"):
		root.switch_scene("res://entities/Menu/Student_MainMenu_Controller.tscn")
	else:
		root.switch_scene("res://entities/Menu/Teacher_MainMenu_Controller.tscn")
	pass