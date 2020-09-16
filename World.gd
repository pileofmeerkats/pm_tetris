extends Node2D


enum DIRECTION {
	LEFT,
	RIGHT,
	DOWN
}


var names = ['dot']
var figures = {
	'dot': [
		[
			[1]
		]
	]
}


var dir = DIRECTION.RIGHT
var current = []
var index = 0
var rotate_index = 0
var posX = Glass.width_half
var posY = 0
var prevX = posX
var prevY = posY


onready var timer = $Timer


func _ready():
	add_figure()


func add_figure():
	get_next_figure()
	Glass.add_figure( current )
	timer.start()


func print_array():
	for i in range( Glass.content.size()):
		var label = get_node( "Labels/Label_" + str( i ))
		label.text = str( Glass.content[i] )


func get_next_figure():
	index = 0
	#index = int( rand_range( 0, names.size()))
	rotate_index = 0
	posX = Glass.width_half
	posY = 0
	Glass.posX = posX
	Glass.posY = posY
	prevX = posX
	prevY = posY
	current = figures[names[index]][rotate_index]


func _process( delta ):
	listen_input()
	print_array()


func listen_input():
	if( Input.is_action_just_pressed( "p_generate" )):
		get_next_figure()
	
	if( Input.is_action_just_pressed( "p_rotate" )):
		rotate_figure()
	
	elif( Input.is_action_just_pressed( "p_left" )):
		move_left()
	
	elif( Input.is_action_just_pressed( "p_right" )):
		move_right()


func rotate_figure():
#	var size = figures[names[index]].size()
#
#	if( rotate_index < size - 1 ):
#		rotate_index += 1
#	else:
#		rotate_index = 0
	
	rotate_index = 0
	current = figures[names[index]][rotate_index]
	Glass.update_figure( current, prevX, prevY )


func move_left():
	if( checkCell( DIRECTION.LEFT )):
		prevX = posX
		prevY = posY
		posX -= 1
		Glass.posX = posX

	Glass.update_figure( current, prevX, prevY )


func move_right():
	if( checkCell( DIRECTION.RIGHT )):
		prevX = posX
		prevY = posY
		posX += 1
		Glass.posX = posX
	
	Glass.update_figure( current, prevX, prevY )


func move_down():
	if( checkCell( DIRECTION.DOWN )):
		prevX = posX
		prevY = posY
		posY += 1
		Glass.posY = posY
	
	Glass.update_figure( current, prevX, prevY )


func checkCell( direction ):
	match direction:
		DIRECTION.LEFT:
			if( posX - 1 < 0 ):
				return false
				
			if( Glass.content[posY][posX - 1] != 0 ):
				return false
		
		DIRECTION.RIGHT:
			if( posX + 1 >= Glass.ROW_SIZE ):
				return false
				
			if( Glass.content[posY][posX + 1] != 0 ):
				return false
		
		DIRECTION.DOWN:
			if( posY + 1 >= Glass.COL_SIZE ):
				return false
			
			if( Glass.content[posY + 1][posX] != 0 ):
				return false
	
	return true


func is_bottom_reached():
	if( !checkCell( DIRECTION.DOWN )):
		return true
	
	return false


func _on_Timer_timeout():
	if( is_bottom_reached()):
		Glass.attach_figure( current )
		add_figure()
		
	move_down()
	check_lines()


func check_lines():
	for i in range( Glass.content.size()):
		if( check_line( i )):
			destroy_line( i )
		
			
func check_line( num ):
	var line_length = 0
	for j in range( Glass.content[num].size()):
			if( Glass.content[num][j] != 0 ):
				line_length += 1
	
	if( line_length > 0 ):
		print( line_length )
	
	if( line_length == Glass.ROW_SIZE ):
		return true
	
	return false

func destroy_line( num ):
	Glass.destroy_line( num )
