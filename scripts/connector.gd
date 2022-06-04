extends Line2D
#draws the lines
var skill_name = ""

func _ready():
	skill_name = str(get_path()).replace("/root/Control/","").replace("/link","")

func _draw():
	for i in Access.pokemon["Unlock"][skill_name]["Connection"]:
		draw_line(Vector2(position.x, position.y), 
				Vector2(Access.pokemon["Unlock"][i]["Position"][0] - Access.pokemon["Unlock"][skill_name]["Position"][0], 
						Access.pokemon["Unlock"][i]["Position"][1] - Access.pokemon["Unlock"][skill_name]["Position"][1]),
				Color(1,1,1), 2)
				
				
		
