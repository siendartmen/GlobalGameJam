extends Node


const DRAGGABLE_BUBBLE = preload("res://TextBubble/draggable_bubble.tscn")
const INTRO: Phase = preload("res://CustomResources/Intro.tres")

##GAME STATS
var ability_points = 4

func use_ability(text_bubble:TextBubble,type) :
	var t = type.new()
	if ability_points >= t.req_points :  ability_points -= t.req_points
	t.use_ability(text_bubble)
	print("USE SINGLETON")
##

var main_camera: Camera2D
var main_node: MainNode
var canvas_layer: CanvasLayer

var is_dragging_bubble := false


func _ready() -> void:
	intro()


func intro() -> void:
	print("intro running")
	print(INTRO)
	for message in INTRO.messages:
		print(message.message)
		#spawn_draggable_bubble(message)


func phase_1() -> void:
	pass


func spawn_draggable_bubble(message: Message) -> void:
	var new_draggable_bubble = DRAGGABLE_BUBBLE.instantiate()
	new_draggable_bubble.global_position = Vector2.ZERO
	main_node.add_child(new_draggable_bubble)
	call_deferred("init_bubble",new_draggable_bubble,message)


func init_bubble(new_draggable_bubble, message: Message) -> void:
	var bubble = new_draggable_bubble.message_bubble.texture_rect;
	bubble.data = message


func notify(txt: String, color: Color) -> void:
	pass
