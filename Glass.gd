extends Node


const ROW_SIZE = 10
const COL_SIZE = 20


var content = []
var width_half = int( ROW_SIZE / 2 )
var posX = width_half
var posY = 0


func _ready():
	create_array()


func create_array():
	for j in range( COL_SIZE ):
		content.append( [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] )


func add_figure( figure_array ):
	posX = width_half
	posY = 0

	content[posY][posX] = figure_array[0][0]


func update_figure( figure_array, prevX, prevY ):
	content[posY][posX] = figure_array[0][0]
	content[prevY][prevX] = 0


func attach_figure( figure_array ):
	content[posY][posX] = figure_array[0][0]


func destroy_line( num ):
	content[num] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	shift_lines( num )


func shift_lines( num ):
	if( num > 0 ):
		content[num] = content[num - 1]
		shift_lines( num - 1 )
