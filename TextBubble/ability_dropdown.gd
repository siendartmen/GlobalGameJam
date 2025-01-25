extends Control

@onready var option_button: OptionButton = $OptionButton

var Abilitys = [
	preload("res://Abilitys/base_ability.gd"),
	preload("res://Abilitys/trace_ability.gd"),
	preload("res://Abilitys/trace_ability.gd"),
	preload("res://Abilitys/trace_ability.gd"),
	preload("res://Abilitys/trace_ability.gd")
]

var hovered = false

var text_bubble:TextBubble = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for i in range(option_button.item_count):
		var points = Abilitys[i].new().get_points()
		option_button.set_item_text(i, option_button.get_item_text(i) + " [ " + str(Singleton.ability_points) + "/" + str(points) + "]")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_option_button_item_selected(index: int) -> void:
	Singleton.use_ability(text_bubble, Abilitys[index])
	self.visible = false

func _on_option_button_mouse_entered() -> void:
	hovered = true


func _on_option_button_mouse_exited() -> void:
	hovered = false
