extends Button


class_name menu_button
# a class for a menu button, this buttons have an id
#  and on press the button also signal it's id

var id = 0

signal pressed_id(_id)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "on_pressed")

func set_id(v):
	id = v

func get_id():
	return id

func on_pressed():
	emit_signal("pressed_id", id)

