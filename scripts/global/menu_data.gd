extends Node


# a global class dedicated to manage the menues for displaying categories 
# of problems

var menu_dic = {
	"numbers":{
		"even_odd":puzzle_even_odd.new(100),
		"min_max": puzzle_minmax_basic.new(100),
		"common_divisor":puzzle_common_divisor.new(10),
		"primes":{
			"prime_detection_very_easy": puzzle_prime_detection.new(50),
			"prime_detection_easy": puzzle_prime_detection.new(100, true),
			"prime_detection_medium": puzzle_prime_detection.new(100, false),
			"prime_detection_hard": puzzle_prime_detection.new(150, false),
			"prime_detection_impossible": puzzle_prime_detection.new(1000, false)
		}
	},
	"addition":{
		"simple":puzzle_addition.new(),
		"negatives": puzzle_addition_negatives.new(),
		"compound": puzzle_addition_compound.new(),
		"ultimate_normal": puzzle_addition_ultimate.new(),
		"ultimate_easy": puzzle_addition_ultimate_easy.new(),
		"blank_easy": puzzle_addition_blank.new(),
		"blank_medium":puzzle_addition_blank.new(5, 50),
		"min_max": puzzle_minmax_addition.new()
	},
	"subtraction":{
		"simple": puzzle_subtraction.new(100),
		"compound_easy": puzzle_subtraction_compound.new(),
		"compound_medium": puzzle_subtraction_compound.new(5, 50, true),
		"compound_hard": puzzle_subtraction_compound.new(5, 100, true),
		"blank": puzzle_subtraction_blank.new(0, 100)
		
	},
	"multiplication":{
		"simple": puzzle_multi_simple.new(),
		"compound": puzzle_multi_compound.new(),
		"negatives": puzzle_multi_negatives.new(15),
		"blank": puzzle_multi_blank.new(1, 15),
		"min_max": puzzle_minmax_multi.new()
	},
	"division":{
		"simple": puzzle_division_simple.new(),
		"with_reminder": puzzle_division.new(),
		"blank": puzzle_division_blank.new(),
		"min_max": puzzle_minmax_division.new(10)
	},
	"fractions":{
		"decimals":{
			"addition": puzzle_fractions_decimals_addition.new(),
			"division": puzzle_fractions_decimals_division.new(),
			"multiplication": puzzle_fractions_decimals_multi.new(),
			"decimal_to_simple": puzzle_fractions_decimals_to_simple.new(),
			"simple_to_decimal": puzzle_fractions_simple_to_decimals.new()
		},
		"simplify":puzzle_fractions_simplify.new(10, 10),
		"addition":puzzle_fractions_addition.new(15),
		"multiplication":puzzle_fractions_multi.new(15),
		"division": puzzle_fractions_division.new(15),
		"equality":puzzle_fractions_equality.new(10, 10),
		"min_max": puzzle_minmax_fractions.new(),
		"percentages_to_fraction":puzzle_percentages_to_fractions.new()
	},
	"arithmetic_order":{
		"positive_easy":puzzle_arithmetic_order.new(0, 5),
		"positive_medium":puzzle_arithmetic_order.new(0, 10),
		"positive_hard":puzzle_arithmetic_order.new(0, 20),
		"negatives_medium":puzzle_arithmetic_order.new(-10, 10),
		"negatives_hard":puzzle_arithmetic_order.new(-20, 20)
	},
	"sequences":{
		"arithmetic":{
			"positive_easy": puzzle_arithmetic_sequence.new(0, 10, 1, 10, true),
			"positive_hard": puzzle_arithmetic_sequence.new(0, 30, -10, 10, true),
			"negatives": puzzle_arithmetic_sequence.new(-30, 30, -30, 30, false)
		}
	},
	"powers":{
		"two":puzzle_powers_two.new()
	},
	"equations":{
		"simple_linear":puzzle_equations_basic.new(20)
	}
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_menu_item(path = []):
	if path.empty():
		return menu_dic
	else:
		var dic = menu_dic.duplicate()
		for i in range(0, path.size()):
			var path_place = path[i]
			dic = dic[path_place]
		return dic
