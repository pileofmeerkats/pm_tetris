extends Node2D

enum DIRECTION { LEFT, RIGHT }


var dir = DIRECTION.RIGHT

var active = false

const Block = preload( "res://Block.tscn" )


func _ready():
	create_figure()
	active = true
	$Timer.start()
	


func create_figure():
	Figures.get_next_figure()
	Glass.add_figure( Figures.current, true )


func _process( delta ):
	listen_input()


func listen_input():
	if( Input.is_action_just_pressed( "p_generate" )):
		Figures.get_next_figure()
		Glass.update_figure( Figures.current, true )
	
	if( Input.is_action_just_pressed("p_rotate")):
		rotate_figure()
	
	if( Input.is_action_just_pressed( "p_left" )):
		move_left()


	if( Input.is_action_just_pressed( "p_right" )):
		move_right()


func rotate_figure():
	#print( 'rotate' )
	Figures.rotate()
	Glass.update_figure( Figures.current )


func move_left():
	Figures.move_left()
	Glass.update_figure( Figures.current )


func move_right():
	Figures.move_right()
	Glass.update_figure( Figures.current )


func _on_Timer_timeout():
	if( active ):
		Figures.move_down()
		Glass.update_figure( Figures.current )
	
