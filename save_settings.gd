extends Node

const SAVE_PATH = "res://player_prefs.cfg"
var _user_config = ConfigFile.new()

func _ready():
	_load()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_hadling_user_quit()
	pass
	
func _hadling_user_quit():
	if NOTIFICATION_WM_CLOSE_REQUEST:
		_save()
		pass

func _save():
		_user_config.set_value("score","_hi_score",Global._hi_score)
		_user_config.save(SAVE_PATH)
		pass
	
func _load():
		var error = _user_config.load(SAVE_PATH)
		if error != OK:
			print("Can not load")
			return null
			
		Global._hi_score = _user_config.get_value("score","_hi_score",Global._hi_score)
		pass
