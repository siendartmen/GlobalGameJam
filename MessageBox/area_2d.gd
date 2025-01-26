extends Area2D

@onready var message_box_area: CollisionShape2D = $Message_Box_Area




const MAX_BUBBLES = 5        # Maximum visible messages in the chat box
const SHRINK_DURATION = 0.3  # Duration for shrinking effect
const SCROLL_DURATION = 0.5  # Duration for scrolling effect
const BUBBLE_SPACING = 10    # Spacing between bubbles
const INTERACTION_LAYER = 2  # Layer for interactable bubbles inside the box

var bubbles_list: Array = [] # List to store active bubbles
var tween: Tween             # Tween node for smooth animations

var shrinking:Node2D = null

# Triggered when a bubble enters the message box
func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if shrinking == null and !bubbles_list.has(body) and Singleton.is_dragging_bubble:
		print("Bubble entered:", body.name)
		shrinking = body
		add_bubble_to_list(shrinking)

# Add bubble to the list, shrink it, and freeze it
func add_bubble_to_list(body: Node2D) -> void:
	print("adding bubble", bubbles_list)
	bubbles_list.append(body)
	body.in_box = true
	call_deferred("freeze_bubble", body)
	
	# Move and shrink the bubble
	shrink_bubble(body)
	
	# Align all bubbles neatly in the message box
	scroll_bubbles_up()

func freeze_bubble(bubble) -> void:
	print("freezing")
	bubble.freeze = true
	bubble.linear_velocity = Vector2.ZERO
	bubble.rigid_body_2d.collision_layer = 0
	bubble.rigid_body_2d.collision_mask = 0


# Shrink the bubble into the message box
func shrink_bubble(bubble: Node2D) -> void:
	print("shrinking ")
	var tween = get_tree().create_tween()
	
	# Shrink the bubble
	var size = Vector2(0.5, 0.5)
	tween.tween_property(bubble, "scale", size, SHRINK_DURATION)
	
	# Add a callback to freeze the bubble after shrinking
	tween.tween_callback(freeze_bubble_final.bind(bubble, size, tween))

func freeze_bubble_final(bubble: Node2D, size:Vector2, tween) :
	print("Bubble shrunk and frozen:", bubble.name)
	freeze_bubble(bubble)
	call_deferred("set_scale_after_tween",bubble,size)
	shrinking = null  # Reset shrinking to allow the next bubble to shrink
	
func set_scale_after_tween(bubble: Node2D, size) :
	bubble.scale = Vector2(0.5, 0.5)
	bubble.restore_rotation(1)
	#bubble.position = Vector2(0,0)
	
	# Smoothly scroll bubbles upward and reposition them
func scroll_bubbles_up() -> void:
	for i in range(bubbles_list.size()):
		var bubble = bubbles_list[i]
		var target_pos = calculate_target_position(i)  # Calculate new position
		move_bubble_to_position(bubble, target_pos)

# Smoothly move a bubble to the target position
func move_bubble_to_position(bubble: Node2D, target_pos: Vector2) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(bubble, "position", target_pos, SCROLL_DURATION)

# Calculate the target position for a bubble based on its index
func calculate_target_position(index: int) -> Vector2:
	var base_y = message_box_area.shape.size.y * -0.5 * message_box_area.scale.y  # Starting Y position for the first bubble
	var y_offset = base_y + index * (BUBBLE_SPACING + get_bubble_height(index))

	# Ensure bubbles are stacked vertically in the box
	return Vector2(0, y_offset) + message_box_area.global_position

# Get the height of a bubble based on its index
func get_bubble_height(index: int) -> float:
	if index >= 0 and index < bubbles_list.size():
		return bubbles_list[index].get_node("CollisionShape2D").shape.extents.y * bubbles_list[index].get_node("CollisionShape2D").scale.y
	
	return 0  # Default height if index is invalid
