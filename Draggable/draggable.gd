extends RigidBody2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var is_dragging = false
var drag_offset = Vector2(0,0)
var follow_speed = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if is_dragging:
		var gain_velocity = ((get_global_mouse_position() - drag_offset) - global_position) * follow_speed
		var close_dampening = 1 if (distance_to_mouse() > radius()) else (1 - (radius() - distance_to_mouse())/radius())
		
		var maxToLerp = radius()*5
		var lerp = clampf(maxToLerp - distance_to_mouse(),0,maxToLerp)
		linear_velocity = (gain_velocity * close_dampening)
		
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and distance_to_mouse() < radius() :
		clicked_input(event)
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
			is_dragging = false
			Singleton.is_dragging_bubble = false


func clicked_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			is_dragging = true
			Singleton.is_dragging_bubble = true
			drag_offset = get_global_mouse_position() - global_position


#region Physics
func _physics_process(delta: float) -> void:
	screen_border_collisions()
	
func screen_border_collisions():
	
	var screen_size = (Singleton.main_camera.global_position + get_viewport().get_visible_rect().size)
	#left side of screen
	if(left() < get_visible_edges().get("left")): linear_velocity = Vector2(abs(linear_velocity.x),linear_velocity.y)
	
	#top side of screen
	if(top() < get_visible_edges().get("top")): linear_velocity = Vector2((linear_velocity.x),abs(linear_velocity.y))
	
	#right side of screen
	if(right() > get_visible_edges().get("right")): linear_velocity = Vector2(-abs(linear_velocity.x),linear_velocity.y)
	
	#bottom side of screen
	if(bottom() > get_visible_edges().get("bottom")): linear_velocity = Vector2((linear_velocity.x),-abs(linear_velocity.y))

#endregion

#region Helper functions
func get_visible_edges() -> Dictionary:
	# Get the viewport's size in pixels
	var viewport_size = get_viewport_rect().size
	
	# Get the camera's global position (center of the screen)
	var camera_position = Singleton.main_camera.global_position
	
	# Calculate the zoom factor (affects the size of the visible area)
	var zoom_factor = Singleton.main_camera.zoom_level
	
	# Calculate half of the visible area, adjusted for zoom
	var half_width = (viewport_size.x / zoom_factor) / 2
	var half_height = (viewport_size.y / zoom_factor) / 2
	
	# Compute the edges of the visible area
	var left = camera_position.x - half_width
	var right = camera_position.x + half_width
	var top = camera_position.y - half_height
	var bottom = camera_position.y + half_height
	
	# Return the edges as a dictionary
	return {
		"left": left,
		"right": right,
		"top": top,
		"bottom": bottom
	}
	
func distance_to_mouse() -> float:
	return get_global_mouse_position().distance_to(global_position);
func radius() -> float:
	return collision_shape_2d.shape.radius;
func left() -> float:
	return global_position.x - radius()
func right() -> float:
	return global_position.x + radius()
func top() -> float:
	return global_position.y - radius()
func bottom() -> float:
	return global_position.y + radius()
#endregion
