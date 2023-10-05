extends CharacterBody2D

const SPEED:float = 100.0
var _move_right:bool

func _ready():
	if self.global_position.x <0:#ถ้าเกิดด้านซ้ายให้เคลื่อนไปทางขวา
		_move_right = true
	else : _move_right = false
	await get_tree().create_timer(5).timeout#หน่วงเวลาก่อนที่จะลบออก
	queue_free()
	pass

func _physics_process(delta):
	if _move_right:
		global_position += transform.x * SPEED * delta
	else :
		global_position -= transform.x * SPEED * delta
	pass
