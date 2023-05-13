extends CharacterBody2D

@export var speed: float = 300.0
@export var jump_velocity: float = -450.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: Vector2 = Vector2.ZERO

func _physics_process(delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		velocity.y = jump_velocity
	if direction:
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
	if is_on_floor():
		if direction.x != 0:
			animated_sprite.play("Run")
		else :
			animated_sprite.play("Idle")
	else :
		animated_sprite.play("Jump")
		
func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
