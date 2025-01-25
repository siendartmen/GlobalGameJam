extends Phase


func _init() -> void:
	messages.append(Message.new("11:00am ", Message.Senders.QUAIL, "Hey, have you heard from Ron? ", Message.Emojis.NONE, 0, -1, 0, ""))
	messages.append(Message.new("11:01am ", Message.Senders.QUAIL, "Just trying to work out went down... ", Message.Emojis.NONE, 0, 1, 0, ""))
	messages.append(Message.new("11:30 am", Message.Senders.JUNE, "Heyy, It's June from Uni! We take SWEN272 together!", Message.Emojis.NONE, 0, 1, 0, ""))
	messages.append(Message.new("1:02pm", Message.Senders.RON, "I'm good, I had a great time last night!", Message.Emojis.NONE, 0, 0.9, 0, ""))
	messages.append(Message.new("1:03pm", Message.Senders.RON, "I was in the middle of preforming Let It Be. I had no idea what was going on.", Message.Emojis.NONE, 0, 0.95, 0, ""))
	messages.append(Message.new("1:04pm", Message.Senders.RON, "It is kind of wild, I believe Nick just... lost it.", Message.Emojis.NONE, 0, 0.6, 0, ""))
	messages.append(Message.new("1:15pm ", Message.Senders.QUAIL, "Talked to Elijiah, he said he heard yelling and then saw nick shove the other person ", Message.Emojis.SHOCKED, 1, 0.9, 0, ""))
	messages.append(Message.new("1:57 pm  ", Message.Senders.QUAIL, "apparently there were some bottles smashed and some pretty knarly punches thrown", Message.Emojis.SHOCKED, 1, 0.15, 0, ""))
	messages.append(Message.new("1:58 pm  ", Message.Senders.LILLIAN , "surely nick was just defending himself... it just doesn't seem like something he would do,", Message.Emojis.THUMBS_UP, 1, 0.65, 0, ""))
	messages.append(Message.new("1:58 pm", Message.Senders.LILLIAN , "we went to get sushi just before they went out, he seemed happy, like we had a good time  ", Message.Emojis.THUMBS_UP, 1, 0.7, 0, ""))
	messages.append(Message.new("2:01 pm ", Message.Senders.CAT , "I heard the other person got really hurt, ", Message.Emojis.ANGRY, 1, 0.15, 0, ""))
	messages.append(Message.new("2:04 pm ", Message.Senders.CAT , "Nick was probably wasted but that's no excuse, you can't just assault someone. ", Message.Emojis.ANGRY, 2, 0.2, 0, ""))
	messages.append(Message.new("4:03 pm ", Message.Senders.MASON, "seems pretty intense, good thing we were studying lol", Message.Emojis.THUMBS_UP, 1, 1, 0, ""))
	
