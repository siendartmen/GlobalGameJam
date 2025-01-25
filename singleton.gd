extends Node


const DRAGGABLE_BUBBLE = preload("res://TextBubble/draggable_bubble.tscn")
const Intro = preload("res://CustomResources/intro.gd")
const Phase1 = preload("res://CustomResources/phase_1.gd")

##GAME STATS
var ability_points = 4

func use_ability(text_bubble:TextBubble,type) :
	var t = type.new()
	var nodeHolder = Node.new()
	nodeHolder.set_script(type)
	main_node.add_child(nodeHolder)
	if ability_points >= t.get_points() : 
		ability_points -= t.get_points()
		nodeHolder.use_ability(text_bubble)
	else :
		notify("Not enough points to use ability", Color(1,0.1,0.1))
##

var main_camera: Camera2D
var main_node: MainNode
var canvas_layer: CanvasLayer

var is_dragging_bubble := false


func _ready() -> void:
	intro()


func intro() -> void:
	var intro = Intro.new()
	for message in intro.messages:
		spawn_draggable_bubble(message)


func phase_1() -> void:
	var phase_1 = Phase1.new()
	for message in phase_1.messages:
		spawn_draggable_bubble(message)


func spawn_draggable_bubble(message) -> void:
	var new_draggable_bubble = DRAGGABLE_BUBBLE.instantiate()
	new_draggable_bubble.global_position = Vector2(randf() * 100 - 50, randf() * 100 - 50)
	main_node.add_child(new_draggable_bubble)
	call_deferred("init_bubble",new_draggable_bubble,message)


func init_bubble(new_draggable_bubble, message: Message) -> void:
	var bubble = new_draggable_bubble.message_bubble.texture_rect;
	bubble.data = message


func notify(txt: String, color: Color) -> void:
	main_node.notification.text = txt
	main_node.notification.color_rect.color = color
	main_node.notification_player.play("notify")
