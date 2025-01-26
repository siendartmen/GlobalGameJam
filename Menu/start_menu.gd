extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/Button.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("Start Button Pressed")
	get_tree().change_scene_to_file("res://main.tscn")

func _on_button_2_pressed() -> void:
	print("Info Button Pressed")
	#get_tree().change_scene_to_file()
	

func _on_button_3_pressed() -> void:
	print("Quit Button Pressed")
	get_tree().quit()
