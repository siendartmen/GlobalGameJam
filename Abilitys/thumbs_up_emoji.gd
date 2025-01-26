extends EmojiBaseAbility


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()

func get_emoji_type() -> Message.Emojis :
	return Message.Emojis.THUMBS_UP 
