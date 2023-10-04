extends Node2D
@export var _hi_score:Label
# Called when the node enters the scene tree for the first time.
func _ready():
	Global._score = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_hi_score.text = str(Global._hi_score)
	pass
