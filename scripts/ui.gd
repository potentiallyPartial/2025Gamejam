extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$playerName.set_text(Master.playerName);
	$fighterName.set_text(Master.fighterName);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
