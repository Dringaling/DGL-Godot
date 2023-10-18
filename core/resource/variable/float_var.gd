extends BaseVar
class_name FloatVar

@export var value: float: 
    set(new_value):
        _value = new_value
    get:
        return _value
