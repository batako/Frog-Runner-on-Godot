class_name GameManager

extends Node

@onready var PointsLabel: Label = %PointsLabel

var points = 0

func add_point(point):
	points += point
	PointsLabel.text = "Points: " + str(points)
