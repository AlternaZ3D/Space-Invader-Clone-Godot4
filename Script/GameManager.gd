extends Node2D

@export var _player:PackedScene
@export var _respawn_point:Node2D
@export var _root_node:Node2D
var _exist:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	Global._lives = 4
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Global._lives >=0 and !_exist:
		_respawn()
	_exist = get_tree().get_nodes_in_group("player").size()>0
	#print(Global._lives)
	pass

func _respawn():
	Global._lives -= 1
	if Global._lives < 0:
		Global._game_over()
	else :
		var p = _player.instantiate()
		p.global_position = _respawn_point.global_position
		_root_node.add_child(p)
	pass
