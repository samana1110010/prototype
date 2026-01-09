extends CharacterBody2D # or Node2D depending on your setup

@export_multiline var lines: Array[String] = [
	"Hello there!",
	"Hello there!",
	"Thank you for the package" ,
	"is this you first deilvery? Oh well heres the movey",
	"You got  ₹400",
	"you can always press b again to get back to walking"
]

var player_in_range = false

func _ready():
	# Connect the Area2D signals to detect player
	$ActionArea.body_entered.connect(_on_body_entered)
	$ActionArea.body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.name == "bro": # Make sure your player node is named "Player"
		player_in_range = true
		# Optional: Show a little "!" icon over their head here

func _on_body_exited(body):
	if body.name == "bro":
		player_in_range = false
		# Optional: Hide the "!" icon

func _input(event):
	if player_in_range and event.is_action_pressed("interact"):
		# This calls the global script we made in Step 3
		Dm.start_dialogue(lines)
