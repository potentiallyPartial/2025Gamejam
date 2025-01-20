extends Node2D

@export var minMoves = 3;
@export var maxMoves = 40;
@export var attackLen = 3;
@export var enemySelected = 0;

var rng = RandomNumberGenerator.new(); # add randomize function to ready
var enemyMoves = Array([], TYPE_INT, "", null);


func makeRandNumEnemyMoves(): 
	var n = rng.randi_range(minMoves, maxMoves);
	for i in n:
		enemyMoves.append(rng.randi_range(1, 4));

func makeNumEnemyMoves():
	for i in attackLen:
		enemyMoves.append(rng.randi_range(1, 4));

func printEnemyMoves():
	var itera = 0;
	for i in enemyMoves:
		print(enemyMoves[itera]);
		itera+=1;

func clearEnemyMoves():
	enemyMoves.clear();


# Called when the node enters the scene tree for the first time.
func _ready():
	attackLen = 3;
	clearEnemyMoves();
	
	makeNumEnemyMoves();
	printEnemyMoves();
	
	clearEnemyMoves();
	
	attackLen = 5;
	print("\nNew moveset:\n");
	makeNumEnemyMoves();
	printEnemyMoves();
	print("\n")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
