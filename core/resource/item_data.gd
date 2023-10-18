extends Resource
class_name ItemData

enum TYPE {
    Bullet,
    Grenade,
    Health
}

@export var name: TYPE
@export var chance: int = 1
@export var color: Color
@export var min_value: int = 1
@export var max_value: int = 10

func get_item_value() -> int:
    return randi_range(min_value, max_value)
