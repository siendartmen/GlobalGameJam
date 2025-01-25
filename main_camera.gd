extends Camera2D


var zoom_level := 1.0
var drag_offset := Vector2.ZERO

@onready var camera_offset := position


func _enter_tree() -> void:
	Singleton.main_camera = self


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.button_mask == MOUSE_BUTTON_MASK_LEFT and not Singleton.is_dragging_bubble:
			global_position -= event.relative / zoom_level
	
	elif event is InputEventMouseButton:
		# Zooming in and out
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			var old_zoom = zoom_level
			zoom_level = min(zoom_level * 1.1, 4.0)
			var mouse_world_pos = -((get_global_mouse_position() - camera_offset) / old_zoom)
			camera_offset += (mouse_world_pos * old_zoom - mouse_world_pos * zoom_level)
			_update_view()
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			var old_zoom = zoom_level
			zoom_level = max(zoom_level * 0.9, 0.1)
			var mouse_world_pos = -((get_global_mouse_position() - camera_offset) / old_zoom)
			camera_offset += (mouse_world_pos * old_zoom - mouse_world_pos * zoom_level)
			_update_view()


func _update_view() -> void:
	zoom = Vector2(zoom_level, zoom_level)
	position = camera_offset
