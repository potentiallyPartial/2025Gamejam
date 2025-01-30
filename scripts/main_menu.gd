extends Control
@onready var instr = $Panel;

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn");


func _on_instructions_pressed():
	instr.set_visible(true);


func _on_button_pressed():
	instr.set_visible(false);
