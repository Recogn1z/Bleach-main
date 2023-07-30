extends Control
const equ_item_pre = preload("res://scene/EUQIM.tscn")
@onready var gold = $top/TextureRect2/Label
@onready var exp =$top/TextureRect4/Label

@onready var baseAttr = $mid/TextureRect/HBoxContainer
@onready var player_equ_nodes = $mid/TextureRect2


func _init() ->void:
	PlayerData.onPlayerDataChange.connect(self.onPlayerDataChange)
	PlayerData.onPlayerAttrChange.connect(self.onPlayerAttrChange)
	PlayerData.onPlayerEquChange.connect(self.onPlayerEquChange)

# Called when the node enters the scene tree for the first time.
func _ready() ->void:
	PlayerData.loadData()

func onPlayerDataChange():
	gold.text = "%s" %PlayerData.player_data["gold"]
	exp.text = "%s" %PlayerData.player_data["exp"]

func onPlayerAttrChange():
	var keys = PlayerData.player_attr.keys()
	var values = PlayerData.player_attr.values()
	var index = 0
	for label in baseAttr.get_children():
		label.text ="%s : %s" %[ConstUtils.getAttrName(keys[index]),values[index]]
		index+=1

func onPlayerEquChange():
	for child in player_equ_nodes.get_children():
		if PlayerData.player_equ.has(child.type):
			child.setData(PlayerData.player_equ[child.type])
		else:
			child.setData(null)

func _on_button_pressed():
	var type = ConstUtils.equ_type[randi()%ConstUtils.equ_type.size()]
	var quality = ConstUtils.equ_quality[randi()%ConstUtils.equ_quality.size()]
	var equ = ConstUtils.createEqu(type,quality)
	var equ_ins = equ_item_pre.instantiate()
	add_child(equ_ins)
	equ_ins.setData(equ)
