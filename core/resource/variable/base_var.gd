extends Resource
class_name BaseVar

signal value_changed(new_value)

var _value:
	set(new_value):
		if _value != new_value:
			_value = new_value
			value_changed.emit(new_value)
	
	get:
		return _value