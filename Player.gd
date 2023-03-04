extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# DO NOT Add the gravity.
	#if not is_on_floor():
	#	velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_left_right = Input.get_axis("ui_left", "ui_right")
	if direction_left_right:
		velocity.x = direction_left_right * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var direction_up_down = Input.get_axis("ui_up", "ui_down")
	if direction_up_down:
		velocity.y = direction_up_down * SPEED
	else: 
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
