extends Popup

func _ready():
	connect("about_to_show",self,"loadLevelInformation")
	$close.connect("pressed",self,"closeLevelInfo")
	$playBtn.connect("pressed",self,"playGame")
	pass # Replace with function body.
	
func loadLevelInformation():

	var lvlIdx = int(levelModel.selectedLevelIdx)
	$levelname.clear()
	$levelname.append_bbcode("[u]" + levelModel.getLevelStageByIdx(lvlIdx) + ": " + levelModel.getLevelNameByIdx(lvlIdx))
	$levelDescription.clear()
	$levelDescription.append_bbcode(levelModel.getLevelDescription(lvlIdx))
	$userScore.clear()
	$userScore.append_bbcode("Your Score: " + levelModel.getLevelScoreByIdx(lvlIdx))

func playGame():
	print("Play Game")
	self.hide()
	
func closeLevelInfo():
	self.hide()
