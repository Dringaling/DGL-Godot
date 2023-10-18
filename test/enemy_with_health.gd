extends Area2D

@onready var _health_bar: = $HealthBar as ProgressBar

func _enter_tree() -> void:
    Contract1.create(Interface.Hitable, self, _hit)

func _ready() -> void:
    _health_bar.value = _health_bar.max_value

func _hit(damage: int):
    _health_bar.value -= damage
