extends Node2D

@export var _player:PackedScene
@export var _respawn_point:Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Global._lives = 3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _respawn():
	Global._lives -= 1
	if Global._lives < 0:
		Global._game_over()
	else :
		await get_tree().create_timer(1.0).timeout
		var p = _player.instantiate()
		add_child.call_deferred(p)
		p.global_position = _respawn_point.global_position
	pass


func _on_child_exiting_tree(node):
	if node.is_in_group("player"):
		_respawn()
	pass # Replace with function body.
