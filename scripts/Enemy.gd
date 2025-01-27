extends Node2D

#@export var minMoves = 3;
#@export var maxMoves = 40;
@export var attackLen = 3;
@export var enemySelected = 0;
@export var minWait = 0;
@export var maxWait = 1;

var curAtack = 0;
@onready var delTimer = $delayTime;
@onready var player = get_parent();

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_delay_time_timeout():
	if curAtack < attackLen:
		print(enemyMoves[curAtack]);
		curAtack += 1;
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
