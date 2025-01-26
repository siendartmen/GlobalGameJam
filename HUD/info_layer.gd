extends CanvasLayer
@onready var control: Control = $Control
@onready var label: Label = $Control/Label


var show_time = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	control.visible = show_time > 0
	show_time -= delta
	
func show_message(message:String, time:float) :
	show_time = time
	label.text = message
