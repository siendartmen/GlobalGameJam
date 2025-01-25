extends BaseAbility

const TRACE_WIDGET = preload("res://HUD/trace_widget.tscn")

var myWidget:TraceWidget = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	req_points = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	if myWidget.current_time <= 0 :
		myWidget.label.text = "Trace Complete: [duration " + myWidget.time_for_trace + "]"\
		+ "\n\nOriginal source of information: " + bubble.data.original_source
	if myWidget.current_time <= -4 :
		Singleton.canvas_layer.remove_child(myWidget)
		

func use_ability(text_bubble:TextBubble) :
	super(text_bubble)
	myWidget = TRACE_WIDGET.instantiate()
	Singleton.canvas_layer.add_child(myWidget)
	#Show widget that shows the trace
	print("USE TRACE")
