extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

const FINAL_BLACK_FADE = preload("res://Menu/final_black_Fade.tscn")
func _on_respond_pressed() -> void:
	Singleton.canvas_layer.add_child(FINAL_BLACK_FADE.instantiate())
	Singleton.canvas_layer.remove_child(self)

func _on_ignore_pressed() -> void:
	Singleton.canvas_layer.add_child(FINAL_BLACK_FADE.instantiate())
	Singleton.canvas_layer.remove_child(self)
