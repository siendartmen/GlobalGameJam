extends CanvasLayer
@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _enter_tree() -> void:
	Singleton.canvas_layer = self

func show_message(message:String, time:float) :
	canvas_layer.show_message(message,time)
