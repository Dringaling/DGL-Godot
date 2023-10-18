extends Node2D

@onready var _bullet = preload("res://test/bullet.tscn")
@onready var _shoot_point = $ShootPoint as Marker2D

func _on_button_2_pressed() -> void:
	get_tree().reload_current_scene()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"): 
		_shoot()

func _shoot() -> void:
	var bullet = _bullet.instantiate() as Bullet
	bullet.position = _shoot_point.position
	var direction = get_global_mouse_position() - _shoot_point.position
	bullet.set_direction(direction)
	add_child(bullet)