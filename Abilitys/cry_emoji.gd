extends EmojiBaseAbility


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	
func get_points() -> int :
	return 0
func get_emoji_type() -> Message.Emojis :
	return Message.Emojis.CRY 
