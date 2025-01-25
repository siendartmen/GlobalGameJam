extends Node
@onready var sender_label: RichTextLabel = $SenderLabel
@onready var message_label: RichTextLabel = $MessageLabel
@onready var timestamp_label: Label = $TimestampLabel
@onready var v_box_container: VBoxContainer = $".."
@onready var texture_rect_2: TextureRect = $"../TextureRect2"
@onready var texture_rect: TextureRect = $"."

@export var sender = "Lizz"
var message = "Hi, how are you doing?\nI've had a really rough week. Can we talk? It would mean a lot"
var timestamp = "8:15am"

#customizable
var time_per_char = .1
var time_to_begin = -0.5
var lerp_height_speed = 0.05
var default_height = 185

#dynamic
var time_from_creation = time_to_begin
var char_displayed = 0
var last_height = 0.0
var parent_draggable: Draggable = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_height(0)
	v_box_container.scale = Vector2(1,0)
	parent_draggable = get_parent().get_parent()
	parent_draggable.begin_hover.connect(_begin_hover)
	parent_draggable.end_hover.connect(_end_hover)

func _begin_hover():
	pass
	
func _end_hover():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if sender_label == null or message_label == null or timestamp_label == null:
		return  # Wait until all labels are properly initialized
	
	time_from_creation += delta
	char_displayed = time_from_creation/time_per_char
	display_text()
	
	
func display_text():
	# set text
	var chars = char_displayed
	if chars <= 0 :
		sender_label.text = ""
		message_label.text = ""
		timestamp_label.text = ""
		var f = 1-abs(time_from_creation/time_to_begin)
		
		v_box_container.scale = Vector2(1,1-abs(time_from_creation/time_to_begin))
		return
	
	var use = min(chars, sender.length())
	sender_label.text = "[b]" + sender.substr(0,use)
	chars -= use
	
	use = min(chars, message.length())
	message_label.text = message.substr(0,use)
	chars -= use
	
	use = min(chars, timestamp.length())
	timestamp_label.text = timestamp.substr(0,use)
	
	#set size based on amount of text
	var height = message_label.get_content_height()
	last_height = last_height*(1-lerp_height_speed) + height*(lerp_height_speed)
	set_height(default_height + last_height)
	
	set_bar_stretch()

func set_height(height : float ):
	v_box_container.size = Vector2(v_box_container.size.x,height)
	
func set_bar_stretch():
	var bottom_line_height = 1
	texture_rect_2.size_flags_stretch_ratio = bottom_line_height / (bottom_line_height + (last_height/35))
