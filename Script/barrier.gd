extends Area2D
var _hp:int
var _index:int
@export var _sprite_decay:Array[Texture2D]
@export var _sprite:Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	_index = 0
	_hp = 4
	pass # Replace with function body.

func _on_area_entered(area):
		if area.is_in_group("bullet"):#ตรวจว่าสิ่งที่ชนใช่กระสุนหรือเปล่า
			_hp=_hp-1
			if _hp <=0:queue_free()
			_decay()
		pass # Replace with function body.

func _decay():#เปลี่ยนspriteเมื่อเกราะโดนโจมตี
		_sprite.set_texture(_sprite_decay[_index])
		if _index < _sprite_decay.size()-1:_index=_index+1
		pass
