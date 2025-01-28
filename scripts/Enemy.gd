extends Node2D

#@export var minMoves = 3;
#@export var maxMoves = 40;
@export var attackLen = 5;
@export var enemySelected = 0;
@export var minWait = 0;
@export var maxWait = 1;

var curAtack = 0;
@onready var delTimer = $delayTime;
@onready var player = get_parent();
@onready var spright = $enemySpright;


var rng = RandomNumberGenerator.new(); # add randomize function to ready
var enemyMoves = Array([], TYPE_INT, "", null);
var enemyTime = Array([], TYPE_FLOAT, "", null);

#func makeRandNumEnemyMoves(): 
	#var n = rng.randi_range(minMoves, maxMoves);
	#for i in n:
		#nemyMoves.append(rng.randi_range(1, 4));

func makeNumEnemyMoves():
	for i in attackLen:
		enemyMoves.append(rng.randi_range(1, 4));
		if i > 0:
			while enemyMoves[i] == enemyMoves[i-1]:
				enemyMoves[i]=rng.randi_range(1, 4);

func makeNumEnemyTime():
	for i in attackLen:
		enemyTime.append(rng.randf_range(minWait, maxWait));

func printEnemyMoves():
	var itera = 0;
	for i in enemyMoves:
		print(enemyMoves[itera]);
		print(enemyTime[itera]);
		itera+=1;

func clearEnemyMoves():
	enemyMoves.clear();

func clearEnemyTimes():
	enemyTime.clear();

func loadPose():
	if curAtack < attackLen:
		delTimer.set_wait_time(enemyTime[curAtack]);
		delTimer.start()
	else :
		print("FIGHT")
		player.loadNextMove();
		

# Called when the node enters the scene tree for the first time.
func _ready():
	clearEnemyMoves();
	clearEnemyTimes();
	print("\nNew moveset:\n");
	makeNumEnemyMoves();
	makeNumEnemyTime();
	loadPose();
	#printEnemyMoves();
	print("\n")

func setSpright():
	if Master.isFight == false:
		if enemyMoves[curAtack - 1] == 1:
			spright.set_frame_and_progress(3,0);
		if enemyMoves[curAtack - 1] == 2:
			spright.set_frame_and_progress(2,0);
		if enemyMoves[curAtack - 1] == 3:
			spright.set_frame_and_progress(4,0);
		if enemyMoves[curAtack - 1] == 4:
			spright.set_frame_and_progress(1,0);
	if Master.isFight == true:
		if enemyMoves[player.curDefenseLen] == 1:
			spright.set_frame_and_progress(8,0);
		if enemyMoves[player.curDefenseLen] == 2:
			spright.set_frame_and_progress(5,0);
		if enemyMoves[player.curDefenseLen] == 3:
			spright.set_frame_and_progress(7,0);
		if enemyMoves[player.curDefenseLen] == 4:
			spright.set_frame_and_progress(6,0);
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_delay_time_timeout():
	if curAtack < attackLen:
		print(enemyMoves[curAtack]);
		curAtack += 1;
		spright.set_frame_and_progress(0,0);
		setSpright();
		loadPose();
		

func setStats():
	attackLen = Master.fighterNumAtacks;
	minWait = Master.fighterTimeingMin;
	maxWait = Master.fighterTimeingMax;
	
#figure out textures for enimies
#get enimies stats transfered
#set up helth system (Pos scrap this if need time)

#things we need 
#more oponents
#hands
#backgrounds 
#Ui art
#win screen
