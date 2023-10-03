extends Node2D
var _destroy_countdown:float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(_destroy_countdown).timeout
	queue_free()
	pass # Replace with function body.



