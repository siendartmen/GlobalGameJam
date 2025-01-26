class_name Message
extends Resource


enum Senders {
	QUAIL,
	LILLIAN,
	JUNE,
	RON,
	MASON,
	CAT,
	NICK
}
var Sender_Colors = [
	Color(0.9,1,0.35),
	Color(0.65,0.95,0.95),
	Color(0.3,0.8,1),
	Color(1,0,0.95),
	Color(0.7,1,0.2),
	Color(0.2,1,0.95),
	Color(.1,.1,1)
]
var Sender_Names = [
	"Quail",
	"Lillian",
	"June",
	"Ron",
	"Mason",
	"Cat",
	"Nick"
]
#Color("#c3d3c7"),
#	Color("#decee3"),
#	Color("#f7d7ae"),
#	Color("#e6a996"),
#	Color("#cfe1e3"),
#	Color(0.9,1,0.95)
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
	"Nick"
]


@export var time: String
@export var sender: Senders
@export var message: String
@export var correct_emoji: Emojis
@export var points: int
@export var truth: int
@export var confused: int
@export var original_source: String


func _init(tim: String = "00:00", s: Senders = Senders.QUAIL, m: String = "Message here", cor: Emojis = Emojis.NONE, p: int = -1, tru: int = -1, con: float = 50, o: String = "Original source here") -> void:
	time = tim
	sender = s
	message = m
	correct_emoji = cor
	points = p
	truth = tru
	confused = con*100
	original_source = o


func get_sender_string() -> String:
	return SENDERS[int(sender)]
