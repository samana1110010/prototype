extends CharacterBody2D
const s=100
var dir="none"
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
func anim(mov):
	var d=dir
	var ani=$AnimatedSprite2D
	if mov==1 :
		ani.flip_h = false
		ani.play("left")
	elif mov==2:
		ani.flip_h=true
		ani.play("left")
	elif mov==3:
		ani.flip_h = false
		ani.play("back")
	elif mov==4:
		ani.flip_h = false
		ani.play("front")
