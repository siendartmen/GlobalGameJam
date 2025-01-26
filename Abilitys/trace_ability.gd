extends BaseAbility

const TRACE_WIDGET = preload("res://HUD/trace_widget.tscn")

var myWidget:TraceWidget = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	display_name = "Trace Ability -" +str(get_points()) + " point"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	if myWidget != null :
		if myWidget.current_time <= 0 :
			myWidget.label.text = "Trace Complete: [duration " + str(myWidget.time_for_trace) + " seconds]"\
			+ "\n\nOriginal source of information: " + (bubble.data.original_source)
		if myWidget.current_time <= -4 :
			Singleton.canvas_layer.remove_child(myWidget)
			myWidget = null
		

func use_ability(text_bubble:TextBubble) :
	super(text_bubble)
	myWidget = TRACE_WIDGET.instantiate()
	Singleton.canvas_layer.add_child(myWidget)
	#Show widget that shows the trace
	
func get_points() -> int :
	return 1
