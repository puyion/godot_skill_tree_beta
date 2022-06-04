extends Control


func _ready():
	pass 

func _process(delta):
	$viewport.position.x = get_local_mouse_position().x
	$viewport.position.y = get_local_mouse_position().y
