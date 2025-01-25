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
	SHOCKED,
	ANGRY,
	THUMBS_UP,
	CRY,
}

const SENDERS = [
	"Quail",
	"Lillian",
	"June",
	"Ron",
	"Mason",
	"Cat",
]


@export var time: String
@export var sender: Senders
@export var message: String
@export var correct_emoji: Emojis
@export var points: int
@export var truth: int
@export var confused: int
@export var original_source: String


func _init(tim: String = "00:00", s: Senders = Senders.QUAIL, m: String = "Message here", cor: Emojis = Emojis.NONE, p: int = -1, tru: int = -1, con: int = -1, o: String = "Original source here") -> void:
	time = tim
	sender = s
	message = m
	correct_emoji = cor
	points = p
	truth = tru
	confused = con
	original_source = o


func get_sender_string() -> String:
	return SENDERS[int(sender)]
