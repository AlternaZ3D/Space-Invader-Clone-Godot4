extends Area2D

var _speed = 250
@export var _explode:PackedScene
#@export var _bullet_parent:Node2D

func _physics_process(delta):
	global_position -= transform.y * _speed * delta#เคลื่อนที่ขึ้นด้านบนตลอดเวลา

func _on_body_entered(body):
	if body.is_in_group("enemy"):#ตรวจว่าถ้าเป็นenemyให้ทำลายเป้าหมายและกระสุน
		body.queue_free()
		_exploding()
	pass # Replace with function body.

func _on_area_entered(area):
	if area.is_in_group("boundary"):#ตรวจว่าชนขอบฉากให้ทำลายกระสุน
		_exploding()
	pass # Replace with function body.
	
func _exploding():
	var e = _explode.instantiate()#สร้างกราฟฟิคระเบิดขึ้นที่จุดตกกระสุน
	e.transform = global_transform
	var _bullet_parent = self.get_parent()
	_bullet_parent.add_child(e)
	queue_free()
	pass
