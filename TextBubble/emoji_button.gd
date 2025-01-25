extends Panel
@onready var button: Button = $Button

@export var emoji_type = "laugh"
@export var emoji_icon = preload("res://Images/CryFaceEmoji.png")

var text_bubble:TextBubble = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.icon = emoji_icon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_button_down() -> void:
	text_bubble.add_emoji(emoji_type,emoji_icon)
