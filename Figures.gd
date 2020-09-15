extends Node

#var names = ['I', 'L', 'J', 'T', 'O', 'S', 'Z', ]
#var figures = {
#	'I': [
#			[ 
#				[1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0]
#			],
#			[ 
#				[1, 1, 1, 1], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]
#			],			
#		],
#	'L': [
#			[
#				[1, 0, 0, 0], [1, 0, 0, 0], [1, 1, 0, 0], [0, 0, 0, 0]
#			],
#			[
#				[1, 1, 1, 0], [1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]
#			],
#			[
#				[1, 1, 0, 0], [0, 1, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0]
#			],
#			[
#				[0, 0, 1, 0], [1, 1, 1, 0], [0, 0, 0, 0], [0, 0, 0, 0]
#			],
#		],
#	'J': [
#			[
#				[0, 1, 0, 0], [0, 1, 0, 0], [1, 1, 0, 0], [0, 0, 0, 0]
#			],
#			[
#				[1, 0, 0, 0], [1, 1, 1, 0], [0, 0, 0, 0], [0, 0, 0, 0]
#			],
#			[
#				[1, 1, 0, 0], [1, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]
#			],
#			[
#				[1, 1, 1, 0], [0, 0, 1, 0], [0, 0, 0, 0], [0, 0, 0, 0]
#			],
#		],
#	'T': [
#			[
#				[1, 1, 1, 0], [0, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]
#			],
#			[
#				[0, 1, 0, 0], [1, 1, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0]
#			],
#			[
#				[0, 1, 0, 0], [1, 1, 1, 0], [0, 0, 0, 0], [0, 0, 0, 0]
#			],
#			[
#				[1, 0, 0, 0], [1, 1, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]
#			],
#		],
#	'O': [
#			[
#				[1, 1, 0, 0], [1, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]
#			]
#		],
#	'S': [
#			[
#				[0, 1, 1, 0], [1, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]
#			],
#			[
#				[1, 0, 0, 0], [1, 1, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0]
#			],
#		],
#	'Z': [
#			[
#				[1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 0], [0, 0, 0, 0]
#			],
#			[
#				[0, 1, 0, 0], [1, 1, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0]
#			],
#		],
#}

var names = ['dot']
var figures = {
	'dot': [
			[
				[1]
			]
		],
}

var current = []
var index = 0
var rotate_index = 0
var posX = Glass.width_half
var posY = 0

enum {
	LEFT,
	RIGHT,
	DOWN
}


func _ready():
	randomize()


func get_next_figure():
	index = 0
	#index = int( rand_range( 0, names.size()))
	rotate_index = 0
	posX = Glass.width_half
	posY = 0
	current = figures[names[index]][rotate_index]


func rotate():
#	var size = figures[names[index]].size()
#
#	if( rotate_index < size - 1 ):
#		rotate_index += 1
#	else:
#		rotate_index = 0
	
	rotate_index = 0
	current = figures[names[index]][rotate_index]


func move_left():
	if( checkCell( LEFT )):
		posX -= 1
		Glass.posX = posX


func move_right():
	if( checkCell( RIGHT )):
		posX += 1
		Glass.posX = posX


func move_down():
	if( checkCell( DOWN )):
		posY += 1
		Glass.posY = posY


func checkCell( direction ):
	match direction:
		LEFT:
			if( posX - 1 < 0 ):
				return false
				
			if( Glass.content[posY][posX - 1] != 0 ):
				return false
		
		RIGHT:
			if( posX + 1 >= Glass.ROW_SIZE ):
				return false
				
			if( Glass.content[posY][posX + 1] != 0 ):
				return false
		
		DOWN:
			if( posY + 1 >= Glass.COL_SIZE ):
				return false
			
			if( Glass.content[posY + 1][posX] != 0 ):
				return false
	
	return true
