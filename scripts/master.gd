extends Node


var playerName = "Anon";

var fighterIndex = [0];
var fighterNum = 0;
var fighterName = "Unknown";
var fighterNumAtacks = 0;
var fighterTimeing = 0;
var texture = 0;

#fighter 1
var f1 = ["pigon",1,5,0]
var f2 = ["theTings",4,2,1]

var roster = [f1,f2]

func setFighter():
	fighterName = roster[fighterIndex[0]][0];
	fighterNumAtacks = roster[fighterIndex[0]][1];
	fighterTimeing = roster[fighterIndex[0]][2];
	texture = roster[fighterIndex[0]][3];
	

var textures = [
	
]
