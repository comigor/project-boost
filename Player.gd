class_name Player extends RigidBody3D

var speed: float = 1
var rotation_speed: float = 1

func _ready() -> void:
    print("hello")

func _process(delta: float) -> void:
    if Input.is_action_pressed("boost"):
        position.y += speed * delta
    if Input.is_action_pressed("rotate_cw"):
        rotate_z(rotation_speed * delta)
    if Input.is_action_pressed("rotate_ccw"):
        rotate_z(-rotation_speed * delta)
