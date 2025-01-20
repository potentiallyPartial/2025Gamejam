extends Node2D

var hover = false;
@export var id = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("click") and hover == true:
		$"../../cauldron"._addThing(id)


func _on_area_2d_mouse_entered():
	hover = true;
func _on_area_2d_mouse_exited():
	hover = false;
