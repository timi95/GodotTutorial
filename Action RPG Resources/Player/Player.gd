extends KinematicBody2D

const FRICTION = 600
const ACCELERATION = 500
const MAX_SPEED = 250

var velocity = Vector2.ZERO

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var animation_player = $AnimationPlayer

func player_movement(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			animation_player.play("RunRight")
		elif input_vector.x < 0:
			animation_player.play("RunLeft")
		elif input_vector.y > 0:
			animation_player.play("RunDown")
		elif input_vector.y < 0:
			animation_player.play("RunUp")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		print("velocity=>",velocity)
	else:
		animation_player.play("IdleRight")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	velocity = move_and_slide(velocity)	

func _physics_process(delta):
	player_movement(delta)


# Called when the node enters the scene tree for the first time.
func _ready():
	#animation_player = $AnimationPlayer
	print("I'm ready for motion")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
