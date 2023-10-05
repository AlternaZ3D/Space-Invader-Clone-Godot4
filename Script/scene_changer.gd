extends Node2D

@export var _key:String
@export var _scene:String 

func _physics_process(_delta):
	var confirm_load = Input.is_action_just_released(_key)#รับคำสั่งจากผู้เล่นด้วยkeyเพื่อเปลี่ยนฉาก
	if confirm_load:
		get_tree().change_scene_to_file(_scene)#เปลี่ยนฉากไปยังsceneที่ตั้งไว้
	pass
