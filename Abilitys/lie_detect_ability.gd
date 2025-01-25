extends BaseAbility

const TRACE_WIDGET = preload("res://HUD/trace_widget.tscn")

var myWidget:TraceWidget = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	if myWidget != null :
		if myWidget.current_time <= 0 :
			var lie_chance = str(bubble.data.truth)
			if bubble.data.truth < 0 : lie_chance = "Inapplicable situation"
			myWidget.label.text = "Lie Detection Complete: [duration " + str(myWidget.time_for_trace) + " seconds]"\
			+ "\n\nLie Chance: " + lie_chance + "%"
		if myWidget.current_time <= -4 :
			Singleton.canvas_layer.remove_child(myWidget)
			myWidget = null
		

func use_ability(text_bubble:TextBubble) :
	super(text_bubble)
	myWidget = TRACE_WIDGET.instantiate()
	Singleton.canvas_layer.add_child(myWidget)
	call_deferred("set_text_deffered")
	#Show widget that shows the trace
	
func get_points() -> int :
	return 4

func set_text_deffered() :
	myWidget.label.text = "



...Lie detection initializing...
...Heart Rate Detection...
...Monitoring voice patterns..."
