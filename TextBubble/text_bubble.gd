extends Node
@onready var sender_label: RichTextLabel = $SenderLabel
@onready var message_label: RichTextLabel = $MessageLabel
@onready var timestamp_label: Label = $TimestampLabel



var sender = "Lizz"
var message = "Hi, how are you doing?"
var timestamp = "8:15am"

var time_per_char = .1

var time_from_creation = -1
var char_displayed = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_from_creation += delta
	char_displayed = time_from_creation/time_per_char
	display_text()
	
	
func display_text():
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
	
