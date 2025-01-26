extends Control

@onready var option_button: OptionButton = $OptionButton

var Abilitys = [
	preload("res://Abilitys/base_ability.gd"),
	preload("res://Abilitys/trace_ability.gd"),
	preload("res://Abilitys/lie_detect_ability.gd"),
	preload("res://Abilitys/trace_ability.gd"),
	preload("res://Abilitys/trace_ability.gd")
]

var hovered = false

var text_bubble:TextBubble = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	for i in range(option_button.item_count):
		if i == 0 : continue
		var points = Abilitys[i].new().get_points()
		option_button.set_item_text(i, option_button.get_item_text(i) + " [ " + str(Singleton.ability_points) + "/" + str(points) + "]")
	
	var name = text_bubble.data.Sender_Names[text_bubble.data.sender]
	var source = text_bubble.data.original_source
	if name == source :
		option_button.set_item_disabled(1,true)
	if text_bubble.data.truth <= 0 :
		option_button.set_item_disabled(2,true)
	option_button.set_item_disabled(3,true)


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
