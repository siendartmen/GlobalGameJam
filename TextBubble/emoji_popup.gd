extends HBoxContainer

@onready var laugh: Panel = $Laugh
@onready var cry: Panel = $Cry
@onready var love: Panel = $Love
@onready var shocked: Panel = $Shocked

var text_bubble:TextBubble = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		laugh.text_bubble = text_bubble
		cry.text_bubble = text_bubble
		love.text_bubble = text_bubble
		shocked.text_bubble = text_bubble


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_up(text : TextBubble) :
	text_bubble = text

func is_hovered() -> bool :
	return laugh.hovered or cry.hovered or love.hovered or shocked.hovered
