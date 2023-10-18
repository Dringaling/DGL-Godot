extends Area2D

func _enter_tree() -> void:
	Contract.create(Interface.Hitable, self, _hit)

func _hit() -> void:
	var tw: Tween = create_tween().set_loops(5)
	tw.tween_property(self, "modulate", Color.RED, 0.1)
	tw.tween_property(self, "modulate", Color.WHITE, 0.1)
