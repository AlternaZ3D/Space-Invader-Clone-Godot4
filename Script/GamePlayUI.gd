extends Node2D
@export var _enemy_left_label:Label
@export var _score:Label
@export var _hi_score:Label
@export var _live:Label
# Called when the node enters the scene tree for the first time.
func _ready():
	Global._score = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_enemy_left_label.text = str(Global._enemy_left)
	_score.text = str(Global._score)
	_hi_score.text = str(Global._hi_score)
	_live.text = str(clamp(Global._lives,0,10))
	pass
