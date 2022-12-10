extends Node2D


# a class for a main practice window. Left side is for menues and right side for
#  questions

# nodes:
onready var button_container = get_node("main_margin_container/main_vbox_container/scroll_container/button_container")
onready var back_button = get_node("main_margin_container/main_vbox_container/back_button")
onready var puzzle_displayer = get_node("puzzle_displayer")
onready var result_sprite = get_node(@"result_sprite")

# array of keys from the dictionary inside "menu_data" that can help navigate
#  the menues
var current_path = []


# Called when the node enters the scene tree for the first time.
func _ready():
	puzzle_displayer.connect("answer_clicked", self, "on_puzzle_displayer_answer_clicked")
	puzzle_displayer.connect("another_pressed", self, "on_puzzle_displayer_another_pressed")
	back_button.connect("pressed", self, "on_back_button_pressed")
	update_gui()

# clears all buttons from the button container
func _clear_buttons():
	for c in button_container.get_children():
		button_container.remove_child(c)
		c.queue_free()

func _update_menu():
	_clear_buttons()
	
	var dic = menu_data.get_menu_item(current_path)
	if typeof(dic) == TYPE_DICTIONARY:
		var keys = dic.keys()
		for k in keys:
			var button = menu_button.new()
			button_container.add_child(button)
			button.set_id(k)
			button.connect("pressed_id", self, "on_button_pressed_id")
			button.text = k
			

func update_gui():
	_update_menu()

func on_button_pressed_id(_id):
	var new_path = current_path.duplicate()
	new_path.append(_id)
	var item = menu_data.get_menu_item(new_path)
	if typeof(item) == TYPE_DICTIONARY:
		current_path = new_path
		puzzle_displayer.hide()
		result_sprite.hide()
		update_gui()
	else: # the item is actually a puzzle and need to be displayed
		puzzle_displayer.set_puzzle(item)
		puzzle_displayer.show()
		result_sprite.hide()

func on_back_button_pressed():
	# deltes the last item of <current_path> if its not empty
	if !current_path.empty():
		current_path.remove(current_path.size() - 1)
		update_gui()

func on_puzzle_displayer_answer_clicked(_answer):
	if _answer:
		result_sprite.change_correct()
		result_sprite.show()
	else:
		result_sprite.change_wrong()
		result_sprite.show()

func on_puzzle_displayer_another_pressed():
	result_sprite.hide()
