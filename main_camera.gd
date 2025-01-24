extends Camera2D


var zoom_level := 1.0
var camera_offset := Vector2.ZERO


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			var old_zoom = zoom_level
			zoom_level = min(zoom_level * 1.1, 2.0)
			var mouse_world_pos = -((get_global_mouse_position() - camera_offset) / old_zoom)
			camera_offset += (mouse_world_pos * old_zoom - mouse_world_pos * zoom_level)
			_update_view()
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			var old_zoom = zoom_level
			zoom_level = max(zoom_level * 0.9, 0.5)
			var mouse_world_pos = -((get_global_mouse_position() - camera_offset) / old_zoom)
			camera_offset += (mouse_world_pos * old_zoom - mouse_world_pos * zoom_level)
			_update_view()


func _update_view() -> void:
	zoom = Vector2(zoom_level, zoom_level)
	position = camera_offset
