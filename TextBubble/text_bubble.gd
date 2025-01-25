extends Node
@onready var sender_label: RichTextLabel = $SenderLabel
@onready var message_label: RichTextLabel = $MessageLabel
@onready var timestamp_label: Label = $TimestampLabel
@onready var v_box_container: VBoxContainer = $".."
@onready var texture_rect_2: TextureRect = $"../TextureRect2"


var sender = "Lizz"
var message = "Hi, how are you doing?\nI've had a really rough week. Can we talk? It would mean a lot."
var timestamp = "8:15am"

var time_per_char = .1

var time_from_creation = -1
var char_displayed = 0

var lerp_height_speed = 0.05
var last_height = 0.0

var default_height = 165

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	v_box_container.size = Vector2(v_box_container.size.x, 0)
	


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
	
	v_box_container.size = Vector2(v_box_container.size.x, default_height + last_height)
	set_bar_stretch()
	
func set_bar_stretch():
	texture_rect_2.size_flags_stretch_ratio = 0.4 - clampf((last_height/35)*0.1, 0, 0.5)
