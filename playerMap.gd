extends CharacterBody2D

const SPEED = 200.0

func _physics_process(delta):
	var movement = Vector2()
	movement.x = Input.get_axis("ui_left","ui_right")
	movement.y = Input.get_axis("ui_up", "ui_down")
	movement = movement.normalized()
	
	update_animation(movement)
	
	velocity = movement * SPEED
	
	move_and_slide()

func update_animation(movement):
	if movement.x > 0:
		$AnimatedSprite2D.play("moves")
		$AnimatedSprite2D.flip_h = false
	elif movement.x < 0:
		$AnimatedSprite2D.play("moves")
		$AnimatedSprite2D.flip_h = true
	elif movement.y > 0:
		$AnimatedSprite2D.play("moves")
	elif movement.y < 0:
		$AnimatedSprite2D.play("moves")
	else:
		$AnimatedSprite2D.play("idle")
