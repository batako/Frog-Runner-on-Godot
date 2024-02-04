extends Node

@onready var button: Button = $Button

func _ready() -> void:
	button.connect("pressed", _on_button_pressed.bind())

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
