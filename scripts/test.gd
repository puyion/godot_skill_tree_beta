extends Node


#this script is for testing code, it has nothing to do with the game

var require = {"a":2, "b":3}
var storage = {"a":3, "c":2}

func _ready():
	for i in require:
		if not(storchecker(i)):
			print("not there")
			break
		if true:
			print("ok")
		print(i)

func storchecker(item):
	var haveit = false
	if item in storage:
		haveit = true
	return(haveit)

