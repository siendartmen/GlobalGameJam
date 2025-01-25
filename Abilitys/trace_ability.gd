extends BaseAbility

const TRACE_WIDGET = preload("res://HUD/trace_widget.tscn")

var myWidget:CanvasLayer = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	req_points = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)

func use_ability(text_bubble:TextBubble) :
	super(text_bubble)
	myWidget = TRACE_WIDGET.instantiate()
	Singleton.canvas_layer.add_child(myWidget)
	#Show widget that shows the trace
	print("USE TRACE")
