extends Node2D
@export var _bonus_enemy:PackedScene
@export var _spawn_pointL:Node2D
@export var _spawn_pointR:Node2D
const TIMER:float = 10.0
var _timer_spawn:float

# Called when the node enters the scene tree for the first time.
func _ready():
	_timer_spawn = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_timer_spawn += delta#บวกเวลาจนกว่าจะครบรอบการปล่อยbonus
	if _timer_spawn>TIMER:#เมื่อเวลาเพียงพอให้ทำขั้นตอนปล่อยโบนัส
		_timer_spawn=0#ล้างตัวนับเวลาเริ่มใหม่
		var b = _bonus_enemy.instantiate()#ปล่อยยานโบนัส
		#print("bonus was spawned")
		var side = randf()#สุ่มว่าจะโผล่มาจากข้างไหน ซ้าย/ขวา
		if side>0.5:
			_spawn_pointL.add_child(b)
		else :
			_spawn_pointR.add_child(b)
	pass
