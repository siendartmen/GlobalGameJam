class_name EmojiBaseAbility
extends BaseAbility

const Message = preload("res://CustomResources/message.gd")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)

func use_ability(text_bubble:TextBubble) :
	super(text_bubble)
	print(str(bubble.data.correct_emoji) + ", " + str(get_emoji_type()))
	if bubble.data.correct_emoji == get_emoji_type() :
		Singleton.ability_points += bubble.data.points
		if bubble.data.points > 0 :
			Singleton.notify("Gained " + str(bubble.data.points) + " points from your reaction", Color(1,1,1))
		else :
			Singleton.notify("Lossed " + str(-bubble.data.points) + " points from your reaction", Color(1,0.1,0.1))
		
	
func get_points() -> int :
	return 0
	
func get_emoji_type() -> Message.Emojis :
	return Message.Emojis.NONE 
