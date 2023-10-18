extends RefCounted
class_name BaseContract

const _MIN_CAPACITY: int = 100000
const _ERROR_MESSAGE: String = "Using create function to make contract to work"
static var _Contracts_Pool: Array[BaseContract] = []
	
static var _capacity: int = _MIN_CAPACITY

static func set_capacity(capacity: int) -> void:
	_capacity = max(capacity, _MIN_CAPACITY)

static func is_over_capacity() -> bool:
	return _Contracts_Pool.size() > _capacity

static func _Create(key, object: Node, callback: Callable, dict: Dictionary) -> void:
	
	if _Exited_Contract_Signal(key, object, dict):
		(dict[key][object] as BaseContract)._on_do_contract.connect(callback)
		return
	
	var contract: BaseContract
		
	if _Contracts_Pool.size() < 1:
		contract = BaseContract.new(false)
	else:
		contract = _Contracts_Pool.pop_back()

	if _Contracts_Pool.size() > _capacity:
		_Contracts_Pool.resize(_capacity)
	
	contract._set_new_contract(key, object, callback, dict)
	
static func _Exited_Contract_Signal(key, object, contract_dict) -> bool:
	return contract_dict.has(key) && (contract_dict[key] as Dictionary).has(object)


signal _on_do_contract
var _key
var _object: Node
var _dict: Dictionary

func _init(created_manually: bool = true) -> void:
	if created_manually: 
		push_error(_ERROR_MESSAGE)

func _set_new_contract(key, object: Node, callback: Callable, dict: Dictionary) -> void:
	_key = key
	_object = object
	_dict = dict
	
	if not dict.has(key):
		dict[key] = {}

	self._on_do_contract.connect(callback)
	dict[key][object] = self
	_object.tree_exited.connect(_clear_contract)
		

func _clear_contract() -> void:
	_object.tree_exited.disconnect(_clear_contract)
	(_dict[_key] as Dictionary).erase(_object)

	if (_dict[_key] as Dictionary).is_empty():
		_dict.erase(_key)
	
	# if Contract pool is not over capacity then add the current contract
	# Otherwise, the contract will be deleted because it has no reference
	if _Contracts_Pool.size() < _capacity:
		_Contracts_Pool.append(self)
		
		# Clear exited callback connection
		var connections: Array = _on_do_contract.get_connections()
		for connect in connections:
			_on_do_contract.disconnect(connect.callable)
	

	


