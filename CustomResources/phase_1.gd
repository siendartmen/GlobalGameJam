extends Phase


func _init() -> void:
	messages.append(Message.new("11:00am ", Message.Senders.QUAIL, "Hey, have you heard from Ron? ", Message.Emojis.NONE, 0, -1, 0.7, "Quail"))
	messages.append(Message.new("11:01am ", Message.Senders.QUAIL, "Just trying to work out went down... ", Message.Emojis.NONE, 0, 1, 0.7, "Quail"))
	messages.append(Message.new("11:30 am", Message.Senders.JUNE, "Heyy, It's June from Uni! We take SWEN272 together!", Message.Emojis.NONE, 0, 1, 0.7, "June"))
	messages.append(Message.new("1:02 pm", Message.Senders.RON, "I'm fine, I had a great time last night!", Message.Emojis.THUMBS_UP, 1, 0.9, 0.7, "Ron"))
	messages.append(Message.new("1:03 pm", Message.Senders.RON, "I was in the middle of preforming Let It Be. I didn't even know the fight was happening", Message.Emojis.CRY, 1, 0.95, 0.7, "Ron"))
	messages.append(Message.new("1:04 pm", Message.Senders.RON, "It's kinda wild, Nick just... lost it.", Message.Emojis.SHOCKED, 1, 0.6, 0.7, "Ron"))
	messages.append(Message.new("1:11pm ", Message.Senders.MASON, "I got a weird txt from Nick last night: 'ngl feeling like starting a fight.. not doing too good man'", Message.Emojis.SHOCKED, 1, 0.8, 0.7, "June"))
	messages.append(Message.new("1:11 pm", Message.Senders.MASON, "he's not sent me something like that befire", Message.Emojis.NONE, 0, 1, 0.7, "Mason"))
	messages.append(Message.new("1:15 pm ", Message.Senders.QUAIL, "Talked to Elijiah, he said he heard yelling and then saw nick shove the other person ", Message.Emojis.SHOCKED, 1, 0.9, 0.7, "Elijiah; a friend of Ron's who was at the karaoke bar."))
	messages.append(Message.new("1:57 pm  ", Message.Senders.QUAIL, "apparently there were some bottles smashed and some pretty knarly punches thrown", Message.Emojis.SHOCKED, 1, 0.15, 0.7, "Kev; a friend of Ron's who was at the karaoke bar."))
	messages.append(Message.new("1:58 pm  ", Message.Senders.LILLIAN , "surely nick was just defending himself... it just doesn't seem like something he would do,", Message.Emojis.THUMBS_UP, 1, 0.65, 0.7, "Lillian "))
	messages.append(Message.new("1:58 pm", Message.Senders.LILLIAN , "we went to get sushi just before they went out, he seemed happy, like we had a good time you know", Message.Emojis.THUMBS_UP, 1, 0.7, 0.7, "Lillian "))
	messages.append(Message.new("2:01 pm ", Message.Senders.CAT , "I heard the other person got really hurt, ", Message.Emojis.ANGRY, 1, 0.15, 0.7, "Elijiah; a friend of Ron's who was at the karaoke bar."))
	messages.append(Message.new("2:04 pm ", Message.Senders.CAT , "Nick was probably wasted but that's no excuse, you can't just assault someone. ", Message.Emojis.ANGRY, 2, 0.2, 0.7, "No one "))
	messages.append(Message.new("4:03 pm ", Message.Senders.MASON, "seems pretty intense, good thing we were studying lol", Message.Emojis.THUMBS_UP, 1, 1, 0.7, "Quail/Mason"))
