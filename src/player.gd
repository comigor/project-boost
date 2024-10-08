class_name Player extends RigidBody3D


## Rocket thrust (how much vertical force is applied when moving).
@export_range(800.0, 3000.0) var thrust: float = 1500.0
## Rocket torque (how much force is applied to "turn" the rocket).
@export_range(100.0, 300.0) var torque: float = 200.0

var is_transitioning = false


func _process(delta: float) -> void:
    if Input.is_action_pressed("boost"):
        apply_central_force(basis.y * thrust * delta)
    if Input.is_action_pressed("rotate_cw"):
        apply_torque(Vector3(0, 0, torque * delta))
    if Input.is_action_pressed("rotate_ccw"):
        apply_torque(Vector3(0, 0, -torque * delta))


func _on_body_entered(body: Node) -> void:
    if body.is_in_group("victory"):
        complete_level(body)
    elif body.is_in_group("hazard"):
        crash_sequence()


func complete_level(body: LandingPad) -> void:
    if !is_transitioning:
        is_transitioning = true
        set_process(false)
        var tween = create_tween()
        tween.tween_interval(1.5)
        tween.tween_callback(func(): get_tree().change_scene_to_file(body.next_level_scene))


func crash_sequence() -> void:
    if !is_transitioning:
        is_transitioning = true
        set_process(false)
        var tween = create_tween()
        tween.tween_interval(1.5)
        tween.tween_callback(get_tree().reload_current_scene)
