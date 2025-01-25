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
	ANGRY,
	THUMBS_UP,
	CRY,
}


var time: String
var sender: Senders
var message: String
var correct_emoji: Emojis
var points: int
var truth: int
var confused: int
var original_source: String


func _init(tim: String, s: Senders, m: String, cor: Emojis, p: int, tru: int, con: int, o: String) -> void:
	time = tim
	sender = s
	message = m
	correct_emoji = cor
	points = p
	truth = tru
	confused = con
	original_source = o
