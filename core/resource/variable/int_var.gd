extends BaseVar
class_name IntVar

@export var value: int: 
    set(new_value):
        _value = new_value
    get:
        return _value
