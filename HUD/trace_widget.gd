class_name TraceWidget
extends CanvasLayer

@onready var progress_bar: ProgressBar = $ProgressBar
@onready var label: Label = $Label

var time_for_trace = 3
var current_time = time_for_trace
var direction = 1
var anim_time = 0.2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var size = clampf(time_for_trace-current_time,0,anim_time)/anim_time
	scale = Vector2(size,size)
	
	if size <= 0 and direction == -1 :
		Singleton.canvas_layer.remove_child(self)
	
	current_time = clampf(current_time - delta * direction,0,time_for_trace)
	if direction >= 0 :
		if current_time >= 0 :
			progress_bar.value = (time_for_trace-current_time)/time_for_trace*100
		else :
			progress_bar.value = 100


func _on_button_pressed() -> void:
	direction = -1
	current_time = time_for_trace - anim_time
	
