extends Node2D
@export var _score:Label
@export var _hi_score:Label
# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
    _score.text = str(Global._score)
    _hi_score.text = str(Global._hi_score)
    pass
