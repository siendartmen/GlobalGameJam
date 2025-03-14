class_name Draggable
extends RigidBody2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var button: Button = $Button
@onready var rigid_body_2d: Draggable = $"."

var is_dragging = false
var drag_offset = Vector2(0,0)
var follow_speed = 800
var auto_rotate_speed = 3

var drag_require_time = 0
var current_drag_time = 0
var start_drag_time = 0
var desire_drag = false

var child_focus = false

var mouse_hovering = false

var in_box = false

signal begin_hover
signal end_hover

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#lerp follow mouse
	#mouse_hover()
	
	do_drag(delta)
	restore_rotation(delta)	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and mouse_hovering :
		clicked_input(event)
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
			is_dragging = false
			Singleton.is_dragging_bubble = false
			current_drag_time = 0
			desire_drag = false


func clicked_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			desire_drag = true
			Singleton.is_dragging_bubble = true
			


func mouse_hover():
	var hover = !is_dragging
	if hover != mouse_hovering :
		mouse_hovering = hover
		if(hover) :
			begin_hover.emit()
		else :
			end_hover.emit()

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

func restore_rotation(delta: float):
	#restore rotation to zero
	var max_velocity_for_auto_rotate = 200
	if abs(rotation_degrees) > 0 and linear_velocity.length() < max_velocity_for_auto_rotate: 
		rotation_degrees = rotation_degrees * (1 - delta * auto_rotate_speed * (max_velocity_for_auto_rotate - linear_velocity.length())/max_velocity_for_auto_rotate )
func do_anim_drag(delta: float):
	pass
func do_drag(delta: float):
	do_anim_drag(delta)
	if desire_drag:
		current_drag_time += delta
		
		if current_drag_time >= drag_require_time and !is_dragging:
			is_dragging = true
			drag_offset = get_global_mouse_position() - global_position
				
	if is_dragging:
		var gain_velocity = ((get_global_mouse_position() - drag_offset) - global_position) * follow_speed
		var close_dampening = 1 if (distance_to_mouse() > radius()*0) else (1 - (radius() - distance_to_mouse())/radius())
		
		var maxToLerp = radius()*5#max distance at which to lerp
		var lerp = 1 - clampf(maxToLerp - distance_to_mouse(),0,maxToLerp)/maxToLerp
		
		linear_velocity = (gain_velocity * close_dampening * lerp * delta)
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
	return get_global_mouse_position().distance_to(global_position + drag_offset);
func radius() -> float:
	return collision_shape_2d.shape.extents.x;
func left() -> float:
	return global_position.x - radius()
func right() -> float:
	return global_position.x + radius()
func top() -> float:
	return global_position.y - radius()
func bottom() -> float:
	return global_position.y + radius()
#endregion




func _on_button_mouse_entered() -> void:
	mouse_hovering = true
	begin_hover.emit()


func _on_button_mouse_exited() -> void:
	mouse_hovering = false
	end_hover.emit()
