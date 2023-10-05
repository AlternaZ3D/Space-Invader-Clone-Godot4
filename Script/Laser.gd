extends Area2D

var _speed = 250
@export var _explode:PackedScene

func _physics_process(delta):#เคลื่อนที่ลงด้านล่างตลอดเวลา
	global_position += transform.y * _speed * delta

func _on_body_entered(body):#เช็คชนผู้เล่น
	if body.is_in_group("player"):
		body.queue_free()
		_exploding()
	pass # Replace with function body.

func _on_area_entered(area):#ตรวจว่าชนขอบฉากให้ทำลายกระสุน
	if area.is_in_group("boundary") or area.is_in_group("barrier"):
		_exploding()
	pass # Replace with function body.
	
func _exploding():#สร้างกราฟฟิคระเบิดขึ้นที่จุดตกกระสุน
	var e = _explode.instantiate()
	e.transform = global_transform
	var _bullet_parent = self.get_parent()
	_bullet_parent.add_child(e)
	queue_free()
	pass
