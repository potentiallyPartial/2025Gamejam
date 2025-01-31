extends Control
@onready var instr = $Panel;
@onready var butNoise = $butPress;

func _on_start_pressed():
	butNoise.play();
	$sceneChange.start();


func _on_instructions_pressed():
	instr.set_visible(true);
	butNoise.play();


func _on_button_pressed():
	instr.set_visible(false);
	butNoise.play();


func _on_scene_change_timeout():
	get_tree().change_scene_to_file("res://scenes/menu.tscn");
