class_name Player extends RigidBody3D

var boost_force: float = 1000.0
var torque_force: float = 100.0

func _process(delta: float) -> void:
    if Input.is_action_pressed("boost"):
        apply_central_force(basis.y * boost_force * delta)
    if Input.is_action_pressed("rotate_cw"):
        apply_torque(Vector3(0, 0, torque_force * delta))
    if Input.is_action_pressed("rotate_ccw"):
        apply_torque(Vector3(0, 0, -torque_force * delta))
