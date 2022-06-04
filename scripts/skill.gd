extends Node2D


#variables
var itemlock = true
var levellock = true
var connectionlock = true
var lockstate = true

var skill_name = ""
var unlockdata = {}

func _ready(): #only runs once
	#any changes/setups in ready are saved and can be called in other functions
	
	#initialize data
	skill_name = str(get_path()).replace("/root/Control/","")
	$icon.texture = load("res://assets/pics/"+str(skill_name)+".png")
	unlockdata = Access.pokemon["Unlock"][skill_name]
	position.x = unlockdata["Position"][0]
	position.y = unlockdata["Position"][1]
	
func _process(delta): #continues to run per frame of game
	conditionlock()
	checklock()

func checklock():
	if lockstate == false:
		$circle.self_modulate = Color(1,1,1)
		$icon.self_modulate = Color(1,1,1)
		$link.self_modulate = Color(1,1,1)

	else:
		$circle.self_modulate = Color(0.5,0.5,0.5)
		$icon.self_modulate = Color(0.5,0.5,0.5)
		$link.self_modulate = Color(0,0,0)
		
func conditionlock():
	#checks level requirement
	if Access.player["Level"] >= unlockdata["Level"]:
		levellock = false
	else:
		levellock = true
	
	#checks item requirement
	for i in unlockdata["Items"]:
		if not(playeritemchecker(i)):
			break
		if Access.player["Items"][i] >= unlockdata["Items"][i]:
			itemlock = false
		else:
			itemlock = true
			break
			
	#checks connection requirement
	if str(unlockdata["Connection"]) == "[]":
		connectionlock = false
	else:
		for i in unlockdata["Connection"]:
			if get_tree().get_root().find_node(i, true, false).lockstate == false:
				connectionlock = false
			
	#determines if the skill is unlockable
	if levellock == false and itemlock == false and connectionlock == false:
		lockstate = false
	else:
		lockstate = true

func playeritemchecker(item):
	var haveit = false
	if item in Access.player["Items"]:
		haveit = true
	return(haveit)



