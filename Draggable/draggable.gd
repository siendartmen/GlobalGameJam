extends Node2D
@onready var collision_shape_2d: CollisionShape2D = $RigidBody2D/CollisionShape2D
@onready var rigid_body_2d: RigidBody2D = $RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and get_global_mouse_position().distance_to(global_position) < :
		rigid_body_2d.apply_impulse(Vector2(300,200))

func _physics_process(delta: float) -> void:
	var screen_size = get_viewport().get_visible_rect().size
	#left side of screen
	if(left())


#HELPER
func radius() -> float:
	return collision_shape_2d.shape.radius;
	
func left() -> float:
	return global_position.x - collision_shape_2d.shape.radius
	
func right() -> float:
	return global_position.x + collision_shape_2d.shape.radius
	
func top() -> float:
	return global_position.y - collision_shape_2d.shape.radius
	
func bottom() -> float:
	return global_position.y + collision_shape_2d.shape.radius
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.is_released():
			#is_dragging = false
#
#
#func _gui_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#is_dragging = true
			#drag_offset = get_global_mouse_position() - global_position
#
#
#func _process(_delta: float) -> void:
	#if is_dragging:
		#global_position = get_global_mouse_position() - drag_offset
	#elif is_resizing:
		#size.x = max(get_global_mouse_position().x - global_position.x, 150.0)
		#size.y = max(get_global_mouse_position().y - global_position.y, 70.0)
