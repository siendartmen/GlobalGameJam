class_name BaseAbility
extends Node

var bubble:TextBubble = null

static var req_points = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func use_ability(text_bubble:TextBubble) :
	bubble = text_bubble
	print("USE BASE ABILITY")
