extends Node

var isFight = false;

var playerName = "Anon";

var fighterIndex = [0];
var fighterNum = 0;
var fighterName = "Unknown";
var fighterNumAtacks = 0;
var fighterTimeingMin = 0;
var fighterTimeingMax = 1;
var texture = 0;

#fighter 1
var f1 = ["pigon",3,1,2,"piggen"]
var f2 = ["gnome",4,.8,2,"Gnome"]
var f3 = ["rubish",5,1,1,"rubish"]
var f4 = ["Techno Wizard",5,1,3,"tWiz"]
var f5 = ["Spooder",4,.5,1.25,"spider"]

var roster = [f1,f2,f3,f4,f5]

func setFighter():
	print(fighterIndex[0])
	fighterName = roster[fighterIndex[0]][0];
	fighterNumAtacks = roster[fighterIndex[0]][1];
	fighterTimeingMin = roster[fighterIndex[0]][2];
	fighterTimeingMax = roster[fighterIndex[0]][2];
	texture = roster[fighterIndex[0]][4];
	

var textures = [
	
]
