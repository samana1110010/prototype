extends CanvasLayer

@onready var box = $PanelContainer
@onready var text_label = $PanelContainer/text_label

var dialogue_lines: Array[String] = []
var current_line_index = 0
var is_active = false
signal line_shown(text)



func start_dialogue(lines: Array[String]):
	if is_active: return
	
	dialogue_lines = lines
	current_line_index = 0
	is_active = true
	box.show()
	
	# Freeze the player so they can't walk away while talking
	# Assumes your player node is named "Player" and is in the "Player" group
	get_tree().call_group("Player", "set_physics_process", false)
	
	show_text()

func show_text():
	var current_line = dialogue_lines[current_line_index]
	text_label.text = current_line

	emit_signal("line_shown", current_line)


func _input(event):
	if not is_active:
		return
		
	if event.is_action_pressed("interact"):
		next_line()

func next_line():
	current_line_index += 1
	if current_line_index < dialogue_lines.size():
		show_text()
	else:
		close_dialogue()

func close_dialogue():
	is_active = false
	box.hide()
	# Unfreeze player
	get_tree().call_group("Player", "set_physics_process", true)
