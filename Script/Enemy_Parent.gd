extends Node2D

const LASER_COOLDOWN:float = 0.8
const SPEED_INITIAL:float = 0.3
var _speed:float
enum DIRECTION {DOWN, RIGHT, LEFT}
enum DIFFICULTY {INIT, EASY , NORMAL , HARD , BOSS}
@export var _laser_prefab:PackedScene
@export var _bullet_parent:Node2D
var _laser_cooldown
var _difficulty:DIFFICULTY
var _direction:DIRECTION
var _down_timer:float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	_direction = DIRECTION.RIGHT #เกมเริ่มให้ไปทางขวาก่อน เพราะเกมต้นฉบับเป็นแบบนี้
	_speed = SPEED_INITIAL
	_difficulty = DIFFICULTY.INIT
	_laser_cooldown = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	_global_update()
	_move_logic()
	_difficulty_chage()
	_laser_cooldown += delta
	if _laser_cooldown >= LASER_COOLDOWN and self.get_children().size()!=0:
		_laser()
		_laser_cooldown=0
	pass

func _move_logic():#ตรรกะการเคลื่อนที่ ทิศลง/ซ้าย/ขวา
	match _direction:
		DIRECTION.DOWN:
			global_position += transform.y * _speed
		DIRECTION.LEFT:
			global_position -= transform.x * _speed
		DIRECTION.RIGHT:
			global_position += transform.x * _speed
	pass

func _direction_change():#บันทึกว่าเข้าชนขอบฉากจากฝั่งไหนตอนกลับจะได้สลับกัน
	var _last_direction:DIRECTION = _direction
	_direction = DIRECTION.DOWN
	await get_tree().create_timer(_down_timer).timeout
	if _last_direction == DIRECTION.RIGHT:
		_direction = DIRECTION.LEFT
	if _last_direction == DIRECTION.LEFT:
		_direction = DIRECTION.RIGHT
	pass

func _on_direction_change_body_entered(body):#ถ้าศัตรูตัวไหนก็ได้ชนข้างฉากให้เรียกฟังก์ชั่นเปลี่ยนทิศทาง
		if 	body.is_in_group("enemy"):
			_direction_change()
			pass # Replace with function body.

func _on_border_body_entered(body):#ถ้าศัตรูลงมาถึงด้านล่างให้เกมโอเวอ
		if 	body.is_in_group("enemy"):
			await get_tree().create_timer(1.0).timeout
			queue_free()
			Global._game_over()
			pass # Replace with function body.

func _speed_up():#จูนความยากของเกม โดยปรับความเร็วให้สอดคล้องสถานะเกม
	match _difficulty:
		DIFFICULTY.BOSS:_speed=SPEED_INITIAL*10
		DIFFICULTY.HARD:_speed=SPEED_INITIAL*5
		DIFFICULTY.NORMAL:_speed=SPEED_INITIAL*3
		DIFFICULTY.EASY:_speed=SPEED_INITIAL*1.5
		DIFFICULTY.INIT:_speed=SPEED_INITIAL*1	
	pass
	
func _difficulty_chage():#ปรับสถานะความยากของเกมตามจำนวนศัตรูที่คงเหลือ
	var _check = self.get_children().size()
	if _check <=0 :	
		Global._you_win() 
		queue_free()
	elif _check < 2  : _difficulty=DIFFICULTY.BOSS
	elif _check < 5 : _difficulty=DIFFICULTY.HARD
	elif _check < 20 : _difficulty=DIFFICULTY.NORMAL
	elif _check < 50 : _difficulty=DIFFICULTY.EASY
	_speed_up()
	pass

func _laser():#ยิงเลเซอโดยใช้ตำแหน่งตัวศัตรูที่ยังอยู่ตัวไหนก็ได้
	var l = _laser_prefab.instantiate()
	var _enemy:Array[Node] = self.get_children()
	l.global_position = _enemy.pick_random().global_position
	_bullet_parent.add_child(l)
	pass

func _global_update():
	Global._enemy_left = self.get_children().size()
	pass
