extends Node


const DRAGGABLE_BUBBLE = preload("res://TextBubble/draggable_bubble.tscn")
const Intro = preload("res://CustomResources/intro.gd")
const Phase1 = preload("res://CustomResources/phase_1.gd")
const Phase2 = preload("res://CustomResources/phase_2.gd")
const Phase3 = preload("res://CustomResources/phase_3.gd")
const Phase4 = preload("res://CustomResources/phase_4.gd")
const Final = preload("res://CustomResources/final.gd")

##GAME STATS
var ability_points = 8

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
var all_draggable_bubbles: Array = []

var zoom_to = -1

var current_phase = 0

var rantime = 5
var mult = 5

func _ready() -> void:
	intro()
	main_camera.zoom_level = 1
	main_camera._update_view()

func _process(delta: float) -> void:
	#set smooth desired zoom
	var amount = delta * 0.2
	if zoom_to != -1 :
		main_camera.zoom_level = main_camera.zoom_level*(1-amount) + (amount)*zoom_to
		main_camera._update_view()
		if abs(main_camera.zoom_level - zoom_to) < 0.05 : zoom_to = -1

var amountNeeded = 0
func intro() -> void:
	var intro = Intro.new()
	amountNeeded += intro.messages.size()
	# first message
	spawn_draggable_bubble(intro.messages[0],Vector2(0,0))
	await get_tree().create_timer(3).timeout
	show_message("Choosing an appropriate emoji reaction can gain you ability points",6)
	await get_tree().create_timer(3).timeout
	zoom_to = 0.3
	await get_tree().create_timer(3).timeout
	show_message("You can click on message bubbles to drag them",6)
	await get_tree().create_timer(5).timeout
	show_message("Scroll MMB to zoom in/out\nclick on the background and drag to move around the camera",20)
	
	for i in range(intro.messages.size()):
		if i == 0 : continue
		var message = intro.messages[i]
		var extra_time = 0
		if intro.messages[i].sender == intro.messages[i-1].sender : extra_time = 6
		
		await get_tree().create_timer(randf()*2.5 + extra_time).timeout
		
		spawn_draggable_bubble(message,Vector2(randf() * 2000 - 1000, randf() * 1400 - 700))
	
	show_message("Put all the messages into the matching message boxes to proceed",25)
	

func phase_1() -> void:
	var phase_1 = Phase1.new()
	amountNeeded += phase_1.messages.size()
	for message in phase_1.messages:
		await get_tree().create_timer(randf()*mult+rantime).timeout
		spawn_draggable_bubble(message,Vector2(randf() * 700 - 50, randf() * 700 - 50))


func phase_2() -> void:
	var phase_2 = Phase2.new()
	amountNeeded += phase_2.messages.size()
	for message in phase_2.messages:
		await get_tree().create_timer(randf()*mult+rantime).timeout
		spawn_draggable_bubble(message,Vector2(randf() * 700 - 50, randf() * 700 - 50))


func phase_3() -> void:
	var phase_3 = Phase3.new()
	amountNeeded += phase_3.messages.size()
	for message in phase_3.messages:
		await get_tree().create_timer(randf()*mult+rantime).timeout
		spawn_draggable_bubble(message,Vector2(randf() * 700 - 50, randf() * 700 - 50))


func phase_4() -> void:
	var phase_4 = Phase4.new()
	amountNeeded += phase_4.messages.size()
	for message in phase_4.messages:
		await get_tree().create_timer(randf()*mult+rantime).timeout
		spawn_draggable_bubble(message,Vector2(randf() * 700 - 50, randf() * 700 - 50))


func final() -> void:
	var final = Final.new()
	amountNeeded += final.messages.size()
	
	for i in range(final.messages.size()-1):
		var message = final.messages[i]
		await get_tree().create_timer(randf()*mult+rantime).timeout
		spawn_draggable_bubble(message,Vector2(randf() * 700 - 50, randf() * 700 - 50))
	
	var fin = final.messages.size()-1
	spawn_draggable_bubble(final.messages[fin],Vector2(0, 0))
	zoom_to = 2
	
const FINAL_OPTION = preload("res://Menu/FinalOption.tscn")

func end_decision() -> void:
	canvas_layer.add_child(FINAL_OPTION.instantiate())
	
func spawn_draggable_bubble(message, position: Vector2) -> void:
	var new_draggable_bubble = DRAGGABLE_BUBBLE.instantiate()
	new_draggable_bubble.global_position = position
	main_node.add_child(new_draggable_bubble)
	all_draggable_bubbles.append(new_draggable_bubble)
	call_deferred("init_bubble",new_draggable_bubble,message)


func init_bubble(new_draggable_bubble, message: Message) -> void:
	var bubble = new_draggable_bubble.message_bubble.texture_rect;
	bubble.data = message
	bubble.set_color()


func notify(txt: String, color: Color) -> void:
	main_node.notification.text = txt
	main_node.notification.color_rect.color = color
	main_node.notification_player.play("notify")

func put_into_box():
	pass

func show_message(message:String,time:float):
	main_node.canvas_layer_2.show_message(message,time)


func added_bubble_to_list() -> void:
	var found_non_listed_bubble = true
	var amount_in_box = 0
	for bubble in all_draggable_bubbles:
		if bubble.in_box:
			amount_in_box +=1
			
	if amount_in_box >= amountNeeded :
		current_phase += 1
		ability_points += 6
		match current_phase:
			0: intro()
			1: phase_1()
			2: phase_2()
			3: phase_3()
			4: phase_4()
			5: final()
			6: end_decision()
