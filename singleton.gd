extends Node


const DRAGGABLE_BUBBLE = preload("res://TextBubble/draggable_bubble.tscn")

var main_camera: Camera2D
var main_node: MainNode

var is_dragging_bubble := false

func _ready() -> void:
	spawn_draggable_bubble("Jill","Okay, we need to talk","8:11pm")

func spawn_draggable_bubble(sender :String, message :String, timestamp :String) -> void:
	var new_draggable_bubble = DRAGGABLE_BUBBLE.instantiate()
	new_draggable_bubble.global_position = Vector2.ZERO
	main_node.add_child(new_draggable_bubble)
	call_deferred("init_bubble",new_draggable_bubble,sender,message,timestamp)
	
func init_bubble(new_draggable_bubble, sender :String, message :String, timestamp :String) -> void:
	var bubble = new_draggable_bubble.message_bubble.texture_rect;
	bubble.sender = sender
	bubble.message = message
	bubble.timestamp = timestamp
