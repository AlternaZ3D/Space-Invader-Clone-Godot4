extends Node
var _enemy_left:int
var _lives:int
var _score:int
var _hi_score:int

func _physics_process(_delta):
	if _score>_hi_score: _hi_score = _score
	pass

func _game_over():#สิ่งที่จะทำเมื่อเกมโอเวอ
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Scene/GAME_OVER.tscn")#ไปที่Sceneหน้าGameOver
	pass

func _you_win():#สิ่งที่จะทำเมื่อชนะเกม
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Scene/YOU_WIN.tscn")#ไปที่Sceneหน้าGameOver
	pass
