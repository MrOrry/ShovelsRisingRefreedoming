extends AudioStreamPlayer

var music

func play_music(levelTheme):
	
	if  not music == load(levelTheme):
		music = load (levelTheme)
		stream = music
		play()
