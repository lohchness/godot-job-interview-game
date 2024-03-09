extends AudioStreamPlayer2D

var tracks = [
	"res://assets/sfx/audience-laughs-short-smartsound-fx-2-2-00-05.mp3",
	"res://assets/sfx/crowd-laughing-03-120582.mp3",
	"res://assets/sfx/crowd-laughing-04-120583.mp3",
	"res://assets/sfx/crowd-laughing-06-120584.mp3",
	"res://assets/sfx/laugh-track-crowd-chuckle-fascinatedsound-1-00-01.mp3",
	"res://assets/sfx/mag_failshout_01.wav",
	"res://assets/sfx/mag_failshout_02.wav",
	"res://assets/sfx/mag_firebolt_fail (mp3cut.net).wav",
	"res://assets/sfx/ui_lockpicking_pickbreak_01 (mp3cut.net).wav",
	"res://assets/sfx/ui_lockpicking_pickbreak_02 (mp3cut.net).wav",
	"res://assets/sfx/ui_lockpicking_pickbreak_03 (mp3cut.net).wav",
	"res://assets/sfx/wpn_tg06_control_staff_shoot_fail_01 (mp3cut.net).wav"
]

func play_random_sound():
	stream = load(tracks.pick_random())
	play()
