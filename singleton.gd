extends Node


const DRAGGABLE_BUBBLE = preload("res://TextBubble/draggable_bubble.tscn")

##GAME STATS
var ability_points = 4

func use_ability(text_bubble:TextBubble,type) :
	var t = type.new()
	if ability_points >= t.req_points :  t.req_points -= 1
	t.use_ability(text_bubble)
	print("USE SINGLETON")
##

var main_camera: Camera2D
var main_node: MainNode

var is_dragging_bubble := false


func _ready() -> void:
	intro()


func intro() -> void:
	spawn_draggable_bubble("Quail","Dude omg, did you hear what happened with Nick last night?","9:11am")


func phase_1() -> void:
	pass


func spawn_draggable_bubble(sender: String, message: String, timestamp: String) -> void:
	var new_draggable_bubble = DRAGGABLE_BUBBLE.instantiate()
	new_draggable_bubble.global_position = Vector2.ZERO
	main_node.add_child(new_draggable_bubble)
	call_deferred("init_bubble",new_draggable_bubble,sender,message,timestamp)


func init_bubble(new_draggable_bubble, sender: String, message: String, timestamp: String) -> void:
	var bubble = new_draggable_bubble.message_bubble.texture_rect;
	bubble.sender = sender
	bubble.message = message
	bubble.timestamp = timestamp


func notify(txt: String, color: Color) -> void:
	pass
