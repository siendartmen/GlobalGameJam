extends BaseAbility

const TRACE_WIDGET = preload("res://HUD/trace_widget.tscn")

var myWidget:TraceWidget = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	display_name = "Social Media Scan -" +str(get_points()) + " points"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	
	if myWidget != null :
		set_text_chars((myWidget.time_for_trace-myWidget.current_time)/myWidget.time_for_trace*desire.length())
		if myWidget.current_time <= 0 :
			var affinity = str(bubble.data.confused)
			myWidget.label.text = "Social Scan Complete: [duration " + str(myWidget.time_for_trace) + " seconds]"\
			+ "\n\nAffinity for Nick: " + affinity + "%"
		
		

func use_ability(text_bubble:TextBubble) :
	super(text_bubble)
	myWidget = TRACE_WIDGET.instantiate()
	myWidget.time_for_trace = 4.7
	myWidget.current_time = myWidget.time_for_trace
	
	Singleton.canvas_layer.add_child(myWidget)
	call_deferred("set_text_deffered")
	#Show widget that shows the trace
	
func get_points() -> int :
	return 1

func set_text_deffered() :
	myWidget.label.text = ""
	
var current_chars = 0
var desire = "

...Scraping social media...
...Search connections...
...Counting reactions and likes...
...Scanning public messages to Nick..."
func set_text_chars(i:int):
	current_chars = max(current_chars,i)
	
	myWidget.label.text = desire.substr(0,current_chars)
