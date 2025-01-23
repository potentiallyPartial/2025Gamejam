extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("lClick"):
		fighterUpdate();


func _on_line_edit_text_submitted(new_text):
	Master.playerName = new_text;

func fighterUpdate():
	var fighter = $ItemList.get_selected_items();
	Master.fighterIndex = fighter;

func _on_button_pressed():
	Master.setFighter();
	get_tree().change_scene_to_file("res://scenes/mainWorld.tscn");

	
