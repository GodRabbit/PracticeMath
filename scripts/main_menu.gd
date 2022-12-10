extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready():
	get_node(@"check_puzzle").connect("pressed", self, "on_check_puzzle_pressed")
	get_node(@"puzzle_displayer").connect("answer_clicked", self, "on_answer_clicked")
	
	test_menu()


func on_check_puzzle_pressed():
	get_node(@"puzzle_displayer").set_puzzle(puzzle_powers_two.new())
	get_node(@"puzzle_displayer").show()

func on_answer_clicked(_correct):
	if _correct:
		print("Gooood JOB!")
	else:
		print("oh... you're wrong")

func test_menu():
	print(menu_data.get_menu_item(["fractions", "decimals", "addition"]))
