extends Panel
@onready var button: Button = $Button

const Message = preload("res://CustomResources/message.gd")

@export var emoji_type = Message.Emojis.ANGRY
@export var emoji_icon = preload("res://Images/CryFaceEmoji.png")
const EmojiAbility = preload("res://Abilitys/emoji_ability.gd")

var text_bubble:TextBubble = null
var hovered = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.icon = emoji_icon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_button_down() -> void:
	if text_bubble != null :
		text_bubble.add_emoji(emoji_type,emoji_icon)
		Singleton.use_ability(text_bubble,EmojiAbility)

func _on_button_mouse_entered() -> void:
	hovered = true
	if text_bubble != null :
		text_bubble.parent_draggable.child_focus = true


func _on_button_mouse_exited() -> void:
	hovered = false
	if text_bubble != null :
		text_bubble.parent_draggable.child_focus = text_bubble.emoji_popup.is_hovered()
