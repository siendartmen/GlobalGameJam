class_name TraceWidget
extends CanvasLayer

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var label: Label = $Label

var time_for_trace = 3
var current_time = time_for_trace
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_time -= delta
	if current_time >= 0 :
		progress_bar.value = (time_for_trace-current_time)/time_for_trace*100
	else :
		progress_bar.value = 100
