extends CharacterBody2D

const speed = 300
const acc = 500
const friction = 200

var input = Vector2.ZERO

func _physics_process(delta):
	player_move(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	print(input.normalized())
	return input.normalized()

func player_move(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() *  (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * acc * delta)
		velocity = velocity.limit_length(speed)
		
	move_and_slide()
			
