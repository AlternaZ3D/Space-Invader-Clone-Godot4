extends Node
var _hi_score:int

func _game_over():#สิ่งที่จะทำเมื่อเกมโอเวอ
	get_tree().change_scene_to_file("res://Scene/GAME_OVER.tscn")#ไปที่Sceneหน้าGameOver
	pass

func _you_win():#สิ่งที่จะทำเมื่อเกมโอเวอ
	get_tree().change_scene_to_file("res://Scene/YOU_WIN.tscn")#ไปที่Sceneหน้าGameOver
	pass
