extends Node# Or whatever your World root is

# 1. MATCH THESE NAMES TO YOUR SCENE TREE
@onready var walker = $"../bro"          # changed from $Player to $bro
@onready var biker = $"../bike"    # Make sure your bike node is named EXACTLY "PlayerBike"

var is_biking = false

func _input(event):
	#  1: Check if the button works at all
	if event.is_action_pressed("toggle_bike"):
		print("Bike Button Pressed!") # <--- If you don't see this, Input Map is wrong
		
		is_biking = not is_biking
		toggle_bike_mode(is_biking)

func toggle_bike_mode(turn_on: bool):
	print("Switching modes... Biking: ", turn_on) # Debug 2
	
	if turn_on:
		# Switch to Bike
		biker.global_position = walker.global_position
		
		biker.visible = true
		biker.process_mode = Node.PROCESS_MODE_INHERIT
		
		walker.visible = false
		walker.process_mode = Node.PROCESS_MODE_DISABLED
		# SWITCH CAMERA TO BIKE
		# assuming the camera is named "Camera2D" inside the bike
		biker.get_node("Camera2D").make_current()
		
	else:
		# Switch to Walker (bro)
		walker.global_position = biker.global_position
		
		walker.visible = true
		walker.process_mode = Node.PROCESS_MODE_INHERIT
		
		biker.visible = false
		biker.process_mode = Node.PROCESS_MODE_DISABLED
		# SWITCH CAMERA BACK TO BRO
		walker.get_node("Camera2D").make_current()
