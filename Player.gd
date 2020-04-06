extends KinematicBody2D

var speed = 0
const MAX_SPEED = 400

var direction = Vector2()

const TOP = Vector2(0, -1)
const RIGHT = Vector2(1, 0)
const DOWN = Vector2(0,1)
const LEFT = Vector2(-1, 0)


func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var is_moving = Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left")
	if is_moving:
		speed = MAX_SPEED
		
		if Input.is_action_pressed("ui_up"):
			direction = TOP
		elif Input.is_action_pressed("ui_right"):
			direction = RIGHT
		elif Input.is_action_pressed("ui_down"):
			direction = DOWN
		elif Input.is_action_pressed("ui_left"):
			direction = LEFT
	else:
		speed = 0
	var velocity = speed * direction * delta
	move_and_collide(velocity)
