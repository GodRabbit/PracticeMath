extends Node2D


# a scene for displaying whther the answer was correct or not

const texture_correct = preload("res://images/gui/correct.png")
const texture_wrong = preload("res://images/gui/wrong.png")

onready var sprite = get_node(@"sprite")

enum STATES{
	CORRECT,
	WRONG
}

var state = STATES.CORRECT

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_gui():
	if state == STATES.CORRECT:
		sprite.texture = texture_correct
	else:
		sprite.texture = texture_wrong

func change_correct():
	state = STATES.CORRECT
	update_gui()

func change_wrong():
	state = STATES.WRONG
	update_gui()
