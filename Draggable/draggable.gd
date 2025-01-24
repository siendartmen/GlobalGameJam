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
		var close_dampening = 1 if (distance_to_mouse() > radius()) else 1 - (radius() - distance_to_mouse())/radius()
		linear_velocity = (gain_velocity * close_dampening)
		
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and distance_to_mouse() < radius() :
		clicked_input(event)
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
			is_dragging = false


func clicked_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			is_dragging = true
			drag_offset = get_global_mouse_position() - global_position


#region Physics
func _physics_process(delta: float) -> void:
	screen_border_collisions()
	
func screen_border_collisions():
	
	var screen_size = DisplayServer.window_get_size()#get_viewport().get_visible_rect().size
	#left side of screen
	if(left() < 0): linear_velocity = Vector2(abs(linear_velocity.x),linear_velocity.y)
	
	#top side of screen
	if(top() < 0): linear_velocity = Vector2((linear_velocity.x),abs(linear_velocity.y))
	
	#right side of screen
	if(right() > screen_size.x): linear_velocity = Vector2(-abs(linear_velocity.x),linear_velocity.y)
	
	#bottom side of screen
	if(bottom() > screen_size.y): linear_velocity = Vector2((linear_velocity.x),-abs(linear_velocity.y))

#endregion

#region Helper functions
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
