extends Node2D


var Figure = preload( "res://Figure.tscn" )


func _ready():
	add_figure()


func _process( delta ):
	print_array()
	#pass


func add_figure():
	var figure = Figure.instance()
	add_child( figure )


func print_array():
	for i in range( Glass.content.size() ):
		var label = get_node( "Labels/Label_" + str( i ))
		label.text = str( Glass.content[i] )
