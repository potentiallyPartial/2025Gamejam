extends Node2D

var page = 0;

var hoverL = false;
var hoverR = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func turnPage(dir):
	if dir == "l" and page > 0:
		page = page -1;
	if dir == "r" and page < 11:
		page = page +1;

#hover Detection Logic
func _on_p_l_mouse_entered():
	hoverL = true;
func _on_p_l_mouse_exited():
	hoverL = false;
func _on_p_r_mouse_entered():
	hoverR = true;
func _on_p_r_mouse_exited():
	hoverR = false;
