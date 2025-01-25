extends Phase


func _init() -> void:
	messages.append(Message.new("4:32 pm", Message.Senders.MASON, "yo- I got a message from nick, hes out", Message.Emojis.NONE, 0, 1, 0, "Nick"))
	messages.append(Message.new("4:35 pm", Message.Senders.MASON, "he wanted me to check if you're ok for some reason? ", Message.Emojis.NONE, 0, 1, 0, "Nick "))
	messages.append(Message.new("4:40 pm ", Message.Senders.QUAIL, "Nick's been released! ", Message.Emojis.SHOCKED, 1, 1, 0, "Mason"))
	messages.append(Message.new("4:43 pm ", Message.Senders.LILLIAN , "wait he's out!", Message.Emojis.NONE, 0, 1, 0, "Quail"))
	messages.append(Message.new("4:45 pm ", Message.Senders.LILLIAN , "people are really mad at him, which I guess I get, but I feel like we need to hear him out you know what I mean?", Message.Emojis.THUMBS_UP , 1, 1, 0, "Lillian "))
	messages.append(Message.new("4:45 pm", Message.Senders.LILLIAN , "he's gone through a lot", Message.Emojis.THUMBS_UP , 1, 0.8, 0, "Lillian"))
	messages.append(Message.new("5:00pm ", Message.Senders.JUNE, "Are you getting my messages? Kinda feels like i'm being ignored tbh haha ", Message.Emojis.NONE, 0, 1, 0, "June"))
	messages.append(Message.new("5:00pm ", Message.Senders.JUNE, "I'm trying to be nice", Message.Emojis.NONE, 0, 0, 0, "June"))
	messages.append(Message.new("5:46 pm ", Message.Senders.CAT , "I really think we should be reallyy carefull about welcoming him back", Message.Emojis.THUMBS_UP , 1, 1, 0, "Cat"))
	messages.append(Message.new("5:47 pm ", Message.Senders.CAT , "we can't keep supporting him when he pulls stuff like this- he ATTACKED someone", Message.Emojis.THUMBS_UP , 1, 1, 0, "Cat"))
	messages.append(Message.new("5:00 pm", Message.Senders.RON, "Hey I'm going to pick Nick up from the station, we can work out what to do afterwards. ", Message.Emojis.NONE, 0, 1, 0, "Ron"))
