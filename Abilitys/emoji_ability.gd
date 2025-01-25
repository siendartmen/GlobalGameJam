extends BaseAbility


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	req_points = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)

func use_ability(text_bubble:TextBubble) :
	super(text_bubble)
	#Show widget that shows the trace
	print("USE EMOJI")
