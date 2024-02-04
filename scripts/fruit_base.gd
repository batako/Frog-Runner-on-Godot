class_name FruitBase

extends Area2D

@export var point: int

@onready var GM: GameManager = %GameManager

func _ready() -> void:
	var script_path = get_script().resource_path
	assert(point > 0, script_path + ": point を設定してください。")
	
	connect("body_entered", _on_body_entered.bind())

func _on_body_entered(body: Node):
	if body.is_in_group("Player"):
		queue_free()
		GM.add_point(point)
