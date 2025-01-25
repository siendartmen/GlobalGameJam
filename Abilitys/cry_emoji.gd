extends EmojiBaseAbility


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	emoji_type = Message.Emojis.CRY 
	
func get_points() -> int :
	return 0
