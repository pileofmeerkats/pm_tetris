extends Node


const ROW_SIZE = 10
const COL_SiZE = 20


enum DIRECTION { LEFT, RIGHT }
var dir = DIRECTION.RIGHT
var row = []
var content = []
var current = []
var width_half = int( ROW_SIZE / 2 )
var posX = width_half
var posY = 0


func _ready():
	create_array()


func add_figure( figure_array, new_figure = true ):
	current = figure_array
	if( new_figure ):
		posX = width_half
		posY = 0

	for i in range( figure_array.size()):
		for j in range( figure_array[i].size()):
			if( figure_array[j][i] != 0 ):
				content[posY + j][posX + i] = figure_array[j][i]


func update_figure( figure_array, new_figure = false ):
	clear_array()
	add_figure( figure_array, new_figure )


func clear_array():
	for i in range( content.size()):
		for j in range( content[i].size()):
			content[i][j] = 0


func create_array():
	for j in range( COL_SiZE ):
		content.append( [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] )
