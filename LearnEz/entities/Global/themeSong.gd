extends AudioStreamPlayer

var songPos 

func _ready():
	pass 

func playSong():
	self.play()
	self.seek(songPos)
	
func stopSong():
	songPos = self.get_playback_position( )
	self.stop()
	