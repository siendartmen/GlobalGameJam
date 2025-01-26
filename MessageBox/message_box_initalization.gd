extends Node2D
@onready var area_2d: Area2D = $Area2D
@onready var label: Label = $Label


@export var label_text = ""

func _ready() -> void:
	label.text = label_text
