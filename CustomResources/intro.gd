extends Phase


func _init() -> void:
	messages.append(Message.new("9:35 am", Message.Senders.QUAIL, "OMG, did you hear what happened with Nick last night? ", Message.Emojis.SHOCKED, 1, -1, 0.75, "Elijiah; a friend of Ron's who was at the karaoke bar. "))
	messages.append(Message.new("9:36 am", Message.Senders.QUAIL, "Talking to some people, I'll try keep you updated x", Message.Emojis.THUMBS_UP , 1, -1, 0.75, "Quail"))
	messages.append(Message.new("10:04 am", Message.Senders.CAT , "I heard about Nick, unforgivable.", Message.Emojis.ANGRY, 2, -1, 0.75, "Quail"))
	messages.append(Message.new("10:35 am", Message.Senders.MASON, "Yo, u left ur calculator st the study group last night, I've picked it up", Message.Emojis.NONE, 0, 1, 0.75, "Mason"))
	messages.append(Message.new("10:36 am", Message.Senders.MASON, "also did u hear about what happened at the kareoke bar? ", Message.Emojis.THUMBS_UP , 1, -1, 0.75, "Mason"))
	messages.append(Message.new("10:42 am", Message.Senders.LILLIAN , "heyy, just wondering if you've heard from nick? i'm worried about him...", Message.Emojis.ANGRY, -2, 1, 0.75, "Lillian"))
	messages.append(Message.new("10:43 am", Message.Senders.LILLIAN , "i can't believe he got arrested", Message.Emojis.CRY, 2, 1, 0.75, "Lillian"))
