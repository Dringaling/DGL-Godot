extends BaseContract
class_name ContractN

static var _contract_dict: Dictionary = {}

static func create(key, object: Node, callback: Callable) -> void:
	_Create(key, object, callback, _contract_dict)

static func do_contract(key, object: Node, arguments: Array) -> void:
	if _Exited_Contract_Signal(key, object, _contract_dict):
		_contract_dict[key][object]._on_do_contract.emit(arguments)

static func do_contract_defered(key, object: Node, arguments: Array) -> void:
	do_contract.call_deferred(key, object, arguments)