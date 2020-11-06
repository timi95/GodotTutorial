extends KinematicBody2D

var velocity = Vector2.ZERO
var SPEED = 4
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func player_movement():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO
	
	move_and_collide(velocity)	

func _physics_process(delta):
	player_movement()


# Called when the node enters the scene tree for the first time.
func _ready():
	print("I'm ready for motion")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
