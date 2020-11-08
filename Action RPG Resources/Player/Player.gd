extends KinematicBody2D

const FRICTION = 400
const ACCELERATION = 50
const MAX_SPEED = 250
var SPEED = 4
var velocity = Vector2.ZERO

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func player_movement(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	print(velocity)
	move_and_collide(velocity)	

func _physics_process(delta):
	player_movement(delta)


# Called when the node enters the scene tree for the first time.
func _ready():
	print("I'm ready for motion")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
