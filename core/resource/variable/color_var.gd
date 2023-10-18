extends BaseVar
class_name ColorVar

@export var value: Color: 
    set(new_value):
        _value = new_value
    get:
        return _value