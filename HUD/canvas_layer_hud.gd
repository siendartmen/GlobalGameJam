extends CanvasLayer

func _enter_tree() -> void:
	Singleton.canvas_layer = self
