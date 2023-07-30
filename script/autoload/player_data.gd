extends Node

const data_path = "./user_data.json"

signal onPlayerDataChange()
signal onPlayerAttrChange()
signal onPlayerEquChange()



var player_data ={}
var player_equ ={}

var player_attr = {
	hp = 100,
	atk = 10
}


func _ready() ->void:
	pass

func loadData():
	var file = FileAccess.open(data_path,FileAccess.READ)
	if file ==null:
		firstLoad()
	else:
		var content = file.get_as_text()
		player_data=JSON.parse_string(content)
	emit_signal("onPlayerDataChange")
	emit_signal("onPlayerAttrChange")
	emit_signal("onPlayerEquChange")


func _saveData():
	var file = FileAccess.open(data_path,FileAccess.WRITE)
	file.store_string(JSON.stringify(player_data))


func firstLoad():
	player_data ={
		gold =0,
		exp =0,
		player_attr = player_attr,
		player_equ = player_equ
	}
	_saveData()

func setGold(type,gold):
	player_data[type]+=gold
	emit_signal("onPlayerDataChange")

func setAttr(type,value):
	player_attr[type] = value
	emit_signal("onPlayerAttrChange")

func equ_up(equ):
	player_equ[equ.type] =equ
	emit_signal("onPlayerEquChange")
