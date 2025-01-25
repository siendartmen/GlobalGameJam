class_name MainNode
extends Node2D


@onready var notification: Control = $CanvasLayer/Notification
@onready var notification_player: AnimationPlayer = $CanvasLayer/NotificationPlayer


func _enter_tree() -> void:
	Singleton.main_node = self
