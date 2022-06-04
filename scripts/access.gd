extends Node
#setup json parameters here

var pokemon = {}

var player = {"Level": 30,
			"Items": 
				{"psyrock": 2,
				"emblem": 1,
				"dawn stone": 1,
				"eevee fur": 1,
				"fire stone": 1}}

func _ready():
	fileload()
	
func fileload():
	var file = File.new()
	file.open("res://assets/json/pokemon2.json", File.READ_WRITE)
	pokemon = parse_json(file.get_as_text())
	file.close()


