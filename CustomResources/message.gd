class_name Message
extends Resource


enum Senders {
	QUAIL,
	LILLIAN,
	JUNE,
	RON,
	MASON,
	CAT
}
enum Emojis {
	NONE,
	ANGRY,
	THUMBS_UP,
	CRY,
}


@export var time: String
@export var sender: Senders
@export var message: String
@export var correct_emoji: Emojis
@export var points: int
@export var truth: int
@export var confused: int
@export var original_source: String


func _init(tim: String, s: Senders, m: String, cor: Emojis, p: int, tru: int, con: int, o: String) -> void:
	time = tim
	sender = s
	message = m
	correct_emoji = cor
	points = p
	truth = tru
	confused = con
	original_source = o
