extends Area2D

const MAX_BUBBLES = 3  # Maximum number of bubbles in the chat box
const SCROLL_SPEED = 0.5  # Speed of scrolling 

# List to keep track of bubbles in the correct order
var bubbles_list: Array = []

# Declare the Tween node here
var tween: Tween

# Called when the node enters the scene tree for the first time
func _ready():
	# Initialize the Tween node using create_tween(), which is valid
	tween = create_tween()  # Create the tween for this node

# Signal handler for when a shape enters the Area2D
func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("Collision detected with:", body.name)
	add_bubble_to_list(body)
	arrange_bubbles()

# Alternative signal for when a body enters
func _on_body_entered(body):
	print("Body entered:", body.name)
	print("Overlapping bodies:", get_overlapping_bodies())
	add_bubble_to_list(body)
	arrange_bubbles()

# Add the bubble to the list and freeze it
func add_bubble_to_list(body):
	# Ensure the body is of the correct type (e.g., a bubble)
	if !bubbles_list.has(body):
		print("Adding bubble:", body.name)
		bubbles_list.append(body)
		
		# Freeze the bubble in place and set its velocity to 0
		body.freeze_mode = RigidBody2D.FREEZE_MODE_STATIC  # Freeze the bubble in place
		body.linear_velocity = Vector2.ZERO  # Ensure the bubble stops moving

# Arrange the bubbles inside the message box
func arrange_bubbles():
	print("arranging bubbles")
	print("bubble list: ", bubbles_list)
	var y_offset = 0
	
	# If the number of bubbles exceeds the limit, scroll all bubbles up
	if bubbles_list.size() > MAX_BUBBLES:
		scroll_bubbles_up()

	# Position each bubble after scrolling (or initially)
	for bubble in bubbles_list:
		# Check if the bubble is already in position before moving it
		if bubble.position != Vector2(0, y_offset):
			move_bubble_to_position(bubble, Vector2(0, y_offset))  # Smoothly move to new position
		y_offset += bubble.get_node("CollisionShape2D").shape.extents.y * 2 + 10  # Adjust spacing

# Scroll all bubbles upwards by a small amount
func scroll_bubbles_up():
	# Scroll all bubbles upwards by a small amount
	for bubble in bubbles_list:
		move_bubble_to_position(bubble, bubble.position + Vector2(0, -SCROLL_SPEED))  # Move bubble up

# Example of moving a bubble to a specific position (optional)
func move_bubble_to_position(bubble, target_pos):
	print("moving bubble")

	# Use the tween to interpolate the position of the bubble
	tween.tween_property(bubble, "position", target_pos, 0.5)
