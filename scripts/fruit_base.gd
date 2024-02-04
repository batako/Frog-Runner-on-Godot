class_name FruitBase

extends Area2D

func _ready() -> void:
	connect("body_entered", _on_body_entered.bind())

func _on_body_entered(body: Node):
	if body.is_in_group("Player"):
		queue_free()
