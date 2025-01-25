extends Draggable
@onready var message_bubble: VBoxContainer = $Message_Bubble


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super(delta)
