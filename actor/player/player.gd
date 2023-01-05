extends Actor

class_name Player

var animated_sprite = $AnimatedSprite2D
var foot_collider = $Area2D/CollisionShape2D

func _ready():
	animated_sprite.play("run")
	

func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		animated_sprite.play("jump")
		foot_collider.disabled = false
		velocity = Vector2(0, 0).lerp(Vector2(0,-100), .1)
#		velocity.y = JUMP_VELOCITY * gravity
	print(velocity)

	move_and_slide()
