extends Draggable
@onready var message_bubble: VBoxContainer = $Message_Bubble


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
	
func do_anim_drag(delta: float):
	if start_drag_time > 0 or is_dragging :
		var anim_speed = 0.2
		if is_dragging :
			start_drag_time = clampf(start_drag_time + delta/anim_speed,0,1)
		else :
			start_drag_time = clampf(start_drag_time - delta/anim_speed,0,1)
			
		var size1 = start_drag_time*0.2 + 1
		print(size1)
		message_bubble.scale = Vector2(size1,size1)
