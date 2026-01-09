extends CharacterBody2D
const s=100
var dir="none"
var energy_timer := 0.0

func _physics_process(delta):
	playermov(delta)
func playermov(delta):
	if Input.is_action_pressed("ui_right"):
		dir="right"
		velocity.x=s
		velocity.y=0
		anim(1)
	elif Input.is_action_pressed("ui_left"):
		dir="left"
		velocity.x=-s
		velocity.y=0
		anim(2)
	elif Input.is_action_pressed("ui_down"):
		dir="down"
		velocity.y=s
		velocity.x=0
		anim(4)
	elif Input.is_action_pressed("ui_up"):
		dir="up"
		velocity.y=-s
		velocity.x=0
		anim(3)
	else :
		velocity.x=0
		velocity.y=0
		$AnimatedSprite2D.play("idle")
	move_and_slide()
	
	var moving := false
	if Input.is_action_pressed("ui_right") \
	or Input.is_action_pressed("ui_left") \
	or Input.is_action_pressed("ui_up") \
	or Input.is_action_pressed("ui_down"):
		moving = true
		if moving:
			energy_timer += delta
			if energy_timer >= 1.0:
				PlayerStats.consume_energy(1)   # lose 1 energy per second of movement
				energy_timer = 0

func anim(mov):
	var d=dir
	var ani=$AnimatedSprite2D
	var dict={1:"right",2:"left",3:"back",4:"front"}
	ani.play(dict[mov])
	
