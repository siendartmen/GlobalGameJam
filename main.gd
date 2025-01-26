class_name MainNode
extends Node2D


@onready var notification: Control = $CanvasLayer/Notification
@onready var notification_player: AnimationPlayer = $CanvasLayer/NotificationPlayer
@onready var canvas_layer_2: CanvasLayer = $CanvasLayer2


func _enter_tree() -> void:
	Singleton.main_node = self
