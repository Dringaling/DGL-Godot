extends Resource
class_name SignalVarBase

signal _internal_signal

func set_callback(callable: Callable):
	_internal_signal.connect(callable)