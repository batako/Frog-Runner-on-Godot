extends CharacterBody2D


const SPEED: float = 400.0
const JUMP_VELOCITY: float = -900.0
@onready var Sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	# Animations
	if (velocity.x > 1 || velocity.x < -1):
		Sprite.animation = "run"
	else:
		Sprite.animation = "idle"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
		if velocity.y < 0:
			Sprite.animation = "jump"
		else:
			Sprite.animation = "fall"

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.x = move_toward(velocity.x, 0, 12)

	move_and_slide()
	
	# 左に移動中は左に向かす
	var is_left = velocity.x < 0
	Sprite.flip_h = is_left
