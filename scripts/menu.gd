extends Control

@onready var but = $BasicButton;
@onready var fight = $FightButton;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("lClick"):
		fighterUpdate();
		print("ping")


func _on_line_edit_text_submitted(new_text):
	Master.playerName = new_text;
	but.play();

func fighterUpdate():
	var fighter = $ItemList.get_selected_items();
	Master.fighterIndex = fighter;
	print("FighterUpdated")

func _on_button_pressed():
	if Master.fighterIndex:
		Master.setFighter();
		fight.play();
		$sceneChange.start();

	


func _on_scene_change_timeout():
	get_tree().change_scene_to_file("res://scenes/mainWorld.tscn");


func _on_item_list_item_selected(index):
	but.play();


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn");
