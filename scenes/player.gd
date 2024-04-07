extends CharacterBody2D


@export var MAX_SPEED = 800.0
@export var ACC = 11500.0
@export var PLAYER_GRIP = 2500.0
@export var PLAYER_MASS = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var input = Vector2.ZERO


var friction_force

func get_player_input():
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	return input.normalized()
	
func player_movement(delta):
	input = get_player_input()
	
	var forces
	if input == Vector2.ZERO:
		forces = - velocity.normalized()*PLAYER_GRIP
	else :
		forces = input*ACC 
	
	velocity = velocity + (forces/PLAYER_MASS)*delta
	velocity = velocity.limit_length(MAX_SPEED)
		
	if (input == Vector2.ZERO) and velocity.length() < PLAYER_GRIP*delta:
		velocity = Vector2.ZERO
	
	move_and_slide()
	


func _physics_process(delta):
	player_movement(delta)
