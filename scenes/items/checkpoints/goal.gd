extends Area2D

@export var MainMenuScene: PackedScene

func _ready() -> void:
	connect("body_entered", _on_body_entered.bind())

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://main_manu.tscn")
