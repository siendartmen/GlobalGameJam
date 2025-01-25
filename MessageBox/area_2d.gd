extends Area2D

const MAX_BUBBLES = 5        # Maximum visible messages in the chat box
const SHRINK_DURATION = 2.7  # Duration for shrinking effect
const SCROLL_DURATION = 0.5  # Duration for scrolling effect
const BUBBLE_SPACING = 10    # Spacing between bubbles
const INTERACTION_LAYER = 2  # Layer for interactable bubbles inside the box

var bubbles_list: Array = [] # List to store active bubbles
var tween: Tween             # Tween node for smooth animations

var shrinking:Node2D = null

func _ready() -> void:
	tween = create_tween()

func _process(delta: float) -> void:
	if shrinking != null :
		freeze_bubble(shrinking)
		
		
	
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
	body.set_freeze_enabled(true)  # Freeze its physics
	body.linear_velocity = Vector2.ZERO  # Stop any movement
	
	# Move and shrink the bubble
	shrink_and_freeze_bubble(body)
	
	# Scroll other bubbles to make space
	scroll_bubbles_up()
	
# Shrink the bubble into the message box
func shrink_and_freeze_bubble(bubble: Node2D) -> void:
	print("freezing and shrinking ")
	var tween = get_tree().create_tween()

	# Shrink the bubble
	var size = Vector2(0.5, 0.5)
	tween.tween_property(bubble, "scale", size, SHRINK_DURATION)

	# Add a callback to freeze the bubble after shrinking
	tween.tween_callback(freeze_bubble_final.bind(bubble, size, tween))

func freeze_bubble(bubble: Node2D) -> void:
	bubble.set_freeze_enabled(true)  # Stop all forces and movements
	bubble.rigid_body_2d.collision_layer = 0
	bubble.rigid_body_2d.collision_mask = 0

func freeze_bubble_final(bubble: Node2D, size:Vector2, tween) :
	freeze_bubble(bubble)
	call_deferred("set_scale_after_tween",bubble,size)
	
func set_scale_after_tween(bubble: Node2D, size) :
	bubble.scale = Vector2(0.5, 0.5)

# Scroll existing bubbles upward to make space
func scroll_bubbles_up() -> void:
	for i in range(bubbles_list.size()):
		var bubble = bubbles_list[i]
		var target_pos = calculate_target_position(i - 1)  # Shift upward
		tween.tween_property(bubble, "position", target_pos, SCROLL_DURATION)

	# Remove bubbles that scroll out of bounds
	if is_out_of_bounds(bubbles_list[0]):
		remove_bubble(bubbles_list[0])

# Remove a bubble when it exits the message box
func remove_bubble(bubble: Node2D) -> void:
	print("Removing bubble:", bubble.name)
	bubbles_list.erase(bubble)
	bubble.queue_free()

# Calculate the target position for a bubble based on its index
func calculate_target_position(index: int) -> Vector2:
	var y_offset = 0
	if index >= 0:
		for i in range(index):
			var bubble = bubbles_list[i]
			y_offset += bubble.get_node("CollisionShape2D").shape.extents.y * 2 + BUBBLE_SPACING
	return Vector2(0, y_offset)

# Check if a bubble is out of bounds
func is_out_of_bounds(bubble: Node2D) -> bool:
	return bubble.position.y + bubble.get_node("CollisionShape2D").shape.extents.y < 0
