extends Button
@onready var button: Button = $"."

@export var emoji_type = "laugh"
@export var emoji_icon = preload("res://Images/CryFaceEmoji.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.icon = emoji_icon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	print(emoji_type)
