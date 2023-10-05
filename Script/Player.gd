extends CharacterBody2D


@export var _speed = 300.0
@export var Bullet:PackedScene
var _bullet_parent:Node2D
var _texture:Texture
var _position:Vector2
var _position_offset:int
var _can_shoot:bool = true

func _ready():
	_texture = get_node("Sprite2D").get_texture()#อ่านค่าSpriteจากSprite2DในPlayer
	_position = get_viewport_rect().size#หาขนาดหน้าต่างเกม
	_position_offset = _texture.get_size().x/2#หาขนาดจากจุดกึ่งกลางตัวละครผู้เล่น
	pass

func _physics_process(delta):
	_move_logic()
	_shoot_logic()
	pass
	
func _move_logic():#ตรรกะการเคลื่อนที่
	var direction = Input.get_axis("move_left", "move_right")#รับค่าจากInput
	if direction:
		velocity.x = direction * _speed
	else:
		velocity.x = move_toward(velocity.x, 0, _speed)#บรรทัดนี้ใช้เพื่อหยุดเมื่อไม่ได้ป้อนทิศทางเป็นการเคลียร์ค่าvelocity
	position.x = clamp(position.x,_position_offset ,_position.x-_position_offset)#ห้ามไม่ให้ตัวผู้เล่นออกนอกหน้าจอ
	move_and_slide()
	pass

func _check_can_shoot():#ตรวจว่ามีกระสุนอยู่บนหน้าจอหรือยังจะได้ไม่ยิงถี่ๆ
	if get_tree().get_nodes_in_group("bullet").size()>=1:
		_can_shoot = false
	else : _can_shoot = true
	pass
	
func _shoot_logic():#ตรรกะการยิงกระสุน
	_check_can_shoot()
	var shooting = Input.is_action_just_pressed("shoot")#รับค่าจากInput
	if shooting and _can_shoot:
			var b = Bullet.instantiate()#สร้างBulletจากPrefabs
			b.transform = global_transform#ปรับตำแหน่งให้อยู่ที่เดียวกับplayer
			_bullet_parent = self.get_parent()
			_bullet_parent.add_child(b)#ย้ายกระสุนไปไว้ที่ๆไม่ใช่playerไม่งั้นจะวิ่งตามๆกัน
			#print ("Nice shot!!!")
	pass
