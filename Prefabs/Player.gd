extends CharacterBody2D


@export var _speed = 300.0
var _texture:Texture
var _position:Vector2
var _position_offset:int

func _ready():
	_texture = get_node("Sprite2D").get_texture()#อ่านค่าSpriteจากSprite2DในPlayer
	_position = get_viewport_rect().size#หาขนาดหน้าต่าง
	_position_offset = _texture.get_size().x/2#หาจุดกึ่งกลางตัวละครผู้เล่น
	pass

func _physics_process(delta):
	_move_logic()
	_shoot_logic()
	pass
	
func _move_logic():
	var direction = Input.get_axis("move_left", "move_right")#รับค่าจากInput
	if direction:
		velocity.x = direction * _speed
	else:
		velocity.x = move_toward(velocity.x, 0, _speed)#บรรทัดนี้ใช้เพื่อหยุดเมื่อไม่ได้ป้อนทิศทางเป็นการเคลียร์ค่าvelocity
	position.x = clamp(position.x,_position_offset ,_position.x-_position_offset)#ห้ามไม่ให้ตัวผู้เล่นออกนอกหน้าจอ
	move_and_slide()
	pass
func _shoot_logic():
	pass

