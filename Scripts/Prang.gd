extends CharacterBody2D


const SPEED = 12000.0
const SPEED_POWERUP = 24000.0


@onready var _anim := $"AnimationPlayer"


func _physics_process(delta):
    if Input.get_action_strength("Mouse") > 0:
        var _mousePos = get_global_mouse_position()
        velocity = (_mousePos - position).normalized() * SPEED * delta
    else:
        velocity = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down"))
        velocity = (velocity.normalized()) * SPEED * delta
    if velocity != Vector2.ZERO:
        _anim.play("Move")
    else:
        _anim.play("Idle")
    move_and_slide()
