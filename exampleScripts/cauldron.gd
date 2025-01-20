extends Node2D

var mouseHover = false;
var contents = [];
var r1 = [1,2,3];
var r2 = [1,1,1];
var r3 = [1,1,1];
var r4 = [1,1,1];
var r5 = [1,1,1];
var r6 = [1,1,1];
var rceBook = [r1, r2, r3, r4, r5, r6];
var current = 0;
var avalable = true;
var numIng = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.set_animation("default");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
# func called by objects when clicked and added to pot
func _addThing(id):
	if avalable == true:
		if contents.size() < 3:
			contents.push_back(id);
			numIng = numIng + 1;
			$Sprite2D.set_frame(numIng);
			#control 4 particle color
		if contents.size() == 3:
			if checkIng():
				$Sprite2D.set_animation("good");
				avalable = false;
				$Timer.start()
			else:
				$Sprite2D.set_animation("bad");
				avalable = false;
				$Timer.start()
			contents.clear();
			numIng = 0;
			
		print(id);

func checkIng():
	var good = true;
	#checks to see if all ingredents are part of curent recipie
	for x in contents:
		if x != rceBook[current][0] and x != rceBook[current][1] and x != rceBook[current][2]:
			good = false;
		#checks for duplcate ingredents
		if contents.count(x) > 1:
			good = false;
		
	return good;
	
#logic for detecting if mouse is over cauldron
func _on_area_2d_mouse_entered():
	mouseHover = true;

func _on_area_2d_mouse_exited():
	mouseHover = false;


func _on_timer_timeout():
	avalable = true;
	$Sprite2D.set_animation("default");
	
