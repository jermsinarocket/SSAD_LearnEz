extends Node2D

onready var userCurrency = $Currency/userCurrency
var result
var responseCode

func _ready():
	root.set_screen_orientation(0)
	get_tree().set_auto_accept_quit(false)
	
	$WorldNumberLbl.clear()
	var worldNumber = int(worldModel.selectWorldIdx) + 1
	$WorldNumberLbl.append_bbcode("[center]World " + str(worldNumber) + "[/center]") 
	$WorldNameLbl.clear()
	$WorldNameLbl.append_bbcode("[center]" + worldModel.getWorldNameByIdx(worldModel.selectWorldIdx) + "[/center]") 
	userCurrency.clear()
	userCurrency.append_bbcode("$" + str(userModel.getUserCurrency()))
	loadPowerupsInformation()
	pass 

func _notification(what):
    if (what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST):
        root.return_to_last()

func loadPowerupsInformation():
	
	var apiUrl = powerupModel.getBaseUrl() + '/all' 
	apiController.apiCallGet(apiUrl)
		
	yield(apiController, "request_completed")

	result = apiController.getResult()
	responseCode = apiController.getResponseCode()

	powerupModel.setPowerups(result)
	
	for button in $Powerup.get_children():
		button.connect("pressed", self, "handleSelectBuyPowerup", [button])
		
	$UserInventory.loadUserInventory()

func handleSelectBuyPowerup(button):
	powerupModel.setSelectedPowerupIdx(int(button.get_index()))
	powerupModel.setSelectedPowerup()
	$BuyPowerUp.popup()