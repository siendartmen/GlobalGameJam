extends Node


const DRAGGABLE_BUBBLE = preload("res://TextBubble/draggable_bubble.tscn")

var main_camera: Camera2D
var main_node: MainNode

var is_dragging_bubble := false


func spawn_draggable_bubble() -> void:
	var new_draggable_bubble = DRAGGABLE_BUBBLE.instantiate()
	new_draggable_bubble.global_position = Vector2.ZERO
	main_node.add_child(new_draggable_bubble)
