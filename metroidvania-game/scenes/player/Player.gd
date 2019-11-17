extends Node2D

export var speed = 100


func _ready():
	pass # Replace with function body.

func _process(delta):
    var animator = $KinematicBody2D/Sprites/PlayerAnimator
    var velocity = Vector2()  # The player's movement vector.
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        pass
    if Input.is_action_pressed("ui_up"):
        pass
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        animator.play("Character_Walking")
    else:
        animator.play("Idle")
    velocity = $KinematicBody2D.move_and_slide(velocity, Vector2(0, -1))
