extends Resource
class_name LevelDatasPacked

@export var level_datas: Array[LevelData] = []

var _current_level: int = 0:
    set(value):
        _current_level = maxi(value, 0)
    get:
        return _current_level

func get_next_level() -> LevelData:
    if not _has_next_level():
        push_warning("Has no next level")
        return null
    
    _current_level += 1
    return level_datas[_current_level]

func _has_next_level() -> bool:
    return level_datas.size() - 1 > _current_level