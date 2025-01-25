class_name TextBubble

extends Node
@onready var sender_label: RichTextLabel = $SenderLabel
@onready var message_label: RichTextLabel = $MessageLabel
@onready var timestamp_label: Label = $TimestampLabel
@onready var v_box_container: VBoxContainer = $".."
@onready var texture_rect_2: TextureRect = $"../TextureRect2"
@onready var texture_rect: TextureRect = $"."
@onready var ability_container: VBoxContainer = $"../TextureRect2/AbilityContainer"

#to create
const EMOJI_POPUP = preload("res://TextBubble/emoji_popup.tscn")
const EMOJI_BUTTON = preload("res://TextBubble/emoji_button.tscn")
const ABILITY_DROPDOWN = preload("res://TextBubble/ability_dropdown.tscn")
const MessageClass = preload("res://CustomResources/message.gd")
@export var anim_curve: Curve

var data:Message = null

#customizable
var time_per_char = .1
var time_to_begin = -0.5
var lerp_height_speed = 0.05
var default_height = 185

#dynamic
var time_from_creation = time_to_begin
var char_displayed = 0
var last_height = 0.0
var parent_draggable: Draggable = null
var emoji_popup:Control = null 
var ability_dropdown:Control = null 

var emoji_add_time = 0

var reaction_emoji = MessageClass.Emojis.NONE
var reaction_emoji_icon: Control = null
var can_use_ability = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_height(0)
	v_box_container.scale = Vector2(1,0)
	parent_draggable = get_parent().get_parent()
	parent_draggable.begin_hover.connect(_begin_hover)
	parent_draggable.end_hover.connect(_end_hover)

func _begin_hover():
	if reaction_emoji == MessageClass.Emojis.NONE and emoji_popup == null:
		emoji_popup = EMOJI_POPUP.instantiate()
		emoji_popup.set_up(self)
		ability_container.add_child(emoji_popup)
	if can_use_ability and ability_dropdown == null:
		ability_dropdown = ABILITY_DROPDOWN.instantiate()
		ability_dropdown.text_bubble = self
		ability_container.add_child(ability_dropdown)
	
func _end_hover():
	if !((ability_dropdown != null and !is_hovered()) or (emoji_popup != null and (!is_hovered() or reaction_emoji != "" ))) :
		return
		
	await get_tree().create_timer(0.01).timeout
	
	if ability_dropdown != null and !is_hovered():
		ability_container.remove_child(ability_dropdown)
		ability_dropdown = null
	if emoji_popup != null and (!is_hovered() or reaction_emoji != MessageClass.Emojis.NONE ):
		ability_container.remove_child(emoji_popup)
		emoji_popup = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if data == null or sender_label == null or message_label == null or timestamp_label == null:
		return  # Wait until all labels are properly initialized
	
	time_from_creation += delta
	char_displayed = time_from_creation/time_per_char
	display_text()
	animate_emoji(delta)
	
	
func display_text():
	# set text
	var chars = char_displayed
	if chars <= 0 :
		sender_label.text = ""
		message_label.text = ""
		timestamp_label.text = ""
		var f = 1-abs(time_from_creation/time_to_begin)
		
		v_box_container.scale = Vector2(1,1-abs(time_from_creation/time_to_begin))
		return
	
	var use = min(chars, data.get_sender_string().length())
	sender_label.text = "[b]" + data.get_sender_string().substr(0,use)
	chars -= use
	
	use = min(chars, data.message.length())
	message_label.text = data.message.substr(0,use)
	chars -= use
	
	use = min(chars, data.time.length())
	timestamp_label.text = data.time.substr(0,use)
	
	#set size based on amount of text
	var height = message_label.get_content_height()
	last_height = last_height*(1-lerp_height_speed) + height*(lerp_height_speed)
	set_height(default_height + last_height)
	
	set_bar_stretch()

func set_height(height : float ):
	v_box_container.size = Vector2(v_box_container.size.x,height)
	if parent_draggable != null :
		parent_draggable.button.size = v_box_container.size + Vector2(0,70)
	
func set_bar_stretch():
	var bottom_line_height = 1
	texture_rect_2.size_flags_stretch_ratio = bottom_line_height / (bottom_line_height + (last_height/35))

func animate_emoji(delta : float) :
	if reaction_emoji_icon != null and emoji_add_time >= 0:
		emoji_add_time -= delta * 2
		
		var size = anim_curve.sample(1- emoji_add_time)*66
		reaction_emoji_icon.button.size = Vector2(size,size)
	
func add_emoji(type : MessageClass.Emojis, texture : Texture) :

	if reaction_emoji == MessageClass.Emojis.NONE :
		var em = EMOJI_BUTTON.instantiate()
		em.emoji_type = type
		em.emoji_icon = texture
		reaction_emoji_icon = em
		ability_container.add_child(em)
		reaction_emoji = type
		ability_container.remove_child(emoji_popup)
		emoji_popup = null
		emoji_add_time = 1
		if ability_dropdown != null:
			ability_container.remove_child(ability_dropdown)
			ability_dropdown = null
	
func is_hovered() -> bool :
	var eh = false
	if emoji_popup != null :
		eh = emoji_popup.is_hovered()
	if ability_dropdown != null :
		eh = eh or ability_dropdown.hovered
	return eh


	
