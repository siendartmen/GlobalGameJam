extends Area2D

const MAX_BUBBLES = 10  # Maximum number of bubbles in the chat box

# Signal triggered when a bubble enters the chat box
func _on_body_entered(body):
		arrange_bubbles()

func arrange_bubbles():
	var bubbles = get_overlapping_bodies()  # Get all the text bubbles in the chat box
	bubbles.sort_custom(Callable(self, "_sort_bubbles"))  # Sort based on timestamp 

	var y_offset = 0
	for bubble in bubbles:
		bubble.freeze_mode = RigidBody2D.FREEZE_MODE_STATIC  # Freeze the bubble in place
		bubble.position = Vector2(0, y_offset)  # Position the bubble
		y_offset += bubble.get_node("CollisionShape2D").shape.extents.y * 2 + 10  # Adjust spacing

func _sort_bubbles(a, b):
	if a.timestamp != b.timestamp:
		return a.timestamp < b.timestamp  # Compare timestamps for sorting

func make_space_for_new_bubble(new_bubble):
	var bubbles = get_overlapping_bodies()
	if bubbles.size() >= MAX_BUBBLES:
		# Remove the oldest bubble (topmost)
		bubbles[0].queue_free()
	arrange_bubbles()  # Rearrange after removing

func move_bubble_to_position(bubble, target_pos):
	var tween = Tween.new()
	add_child(tween)
	tween.interpolate_property(bubble, "position", bubble.position, target_pos, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
