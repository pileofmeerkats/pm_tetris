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
	]
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
	if( posX > 0 ):
		posX -= 1
		Glass.posX = posX


func move_right():
	if( posX < Glass.ROW_SIZE - 1 and checkCollision( RIGHT )):
		posX += 1
		Glass.posX = posX


func move_down():
	if( posY < Glass.COL_SiZE - 1 and checkCollision( DOWN )):
		posY += 1
		Glass.posY = posY
		print( 'move down' )


func canMove():
	var farX = 0
	
	for i in range( current.size()):
		for j in range( current[i].size()):
			if( current[i][j] != 0 and j > farX ):
				farX = j
	
	if( farX + posX >= Glass.ROW_SIZE - 1 ):
		return false
		
	return true


func checkCollision( direction ):
	match direction:
		LEFT:
			pass
		
		RIGHT:
			pass
		
		DOWN: 
			pass

	return false


func checkCell( pos_x, pos_y, direction ):
	var is_empty = false
	
	match direction:
		LEFT:
			if( pos_x - 1 < 0 ):
				return false
				
			if( Glass.content[pos_y][pos_x - 1] ):
				pass
		
		RIGHT:
			pass
		
		DOWN:
			pass
	
	return is_empty
