extends Panel
@onready var button: Button = $Button

@export var emoji_type = "laugh"
@export var emoji_icon = preload("res://Images/CryFaceEmoji.png")

var text_bubble:TextBubble = null
var hovered = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.icon = emoji_icon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(hovered)

func _on_button_button_down() -> void:
	if text_bubble != null :
		text_bubble.add_emoji(emoji_type,emoji_icon)


func _on_button_mouse_entered() -> void:
	hovered = true
	if text_bubble != null :
		text_bubble.parent_draggable.child_focus = true


func _on_button_mouse_exited() -> void:
	hovered = false
	if text_bubble != null :
		text_bubble.parent_draggable.child_focus = text_bubble.emoji_popup.is_hovered()
