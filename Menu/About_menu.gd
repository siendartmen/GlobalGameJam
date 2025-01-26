class_name AboutMenu
extends Control

@onready var button: Button = $MarginContainer/VBoxContainer/Button as Button

signal exit_about_menu

func _on_button_pressed() -> void:
	print("Exit Button Pressed in About")
	get_tree().change_scene_to_file("res://Menu/StartMenu.tscn")
