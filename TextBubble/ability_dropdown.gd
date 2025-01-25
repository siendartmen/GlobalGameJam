extends Control

var Abilitys = [
	preload("res://Abilitys/base_ability.gd"),
	preload("res://Abilitys/trace_ability.gd")
]

var hovered = false

var text_bubble:TextBubble = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_option_button_item_selected(index: int) -> void:
	
	Singleton.use_ability(text_bubble, Abilitys[index])

func _on_option_button_mouse_entered() -> void:
	hovered = true


func _on_option_button_mouse_exited() -> void:
	hovered = false
