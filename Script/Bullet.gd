extends Area2D

var _speed = 650
@export var _explode:PackedScene

func _physics_process(delta):
	global_position -= transform.y * _speed * delta#เคลื่อนที่ขึ้นด้านบนตลอดเวลา
	pass

func _on_body_entered(body):#ตรวจว่าถ้าเป็นenemyให้ทำลายเป้าหมายและกระสุน
	if body.is_in_group("enemy") or body.is_in_group("bonus"):
		body.queue_free()
		_exploding()
		if body.is_in_group("10"):Global._score+=10
		elif body.is_in_group("20"):Global._score+=20
		elif body.is_in_group("20"):Global._score+=30
		elif body.is_in_group("bonus"):Global._score+=100
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

