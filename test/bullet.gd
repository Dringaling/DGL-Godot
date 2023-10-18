extends Area2D
class_name Bullet

@export var _speed: int = 600
@export var _damage: int = 1

var _direction: Vector2

func set_direction(direction: Vector2) -> void:
	_direction = direction.normalized()

func _process(_delta: float) -> void:
	position += _delta * _speed * _direction

func _on_area_entered(area:Area2D) -> void:
	Contract.do_contract(Interface.Hitable, area)
	Contract1.do_contract(Interface.Hitable, area, _damage)
	queue_free()


