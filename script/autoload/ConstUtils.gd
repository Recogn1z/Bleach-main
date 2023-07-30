extends Node

var attr_type = {
	"hp" :"HP",
	"atk" :"      ATTACK"
}

var quality_frame = {
	"B" :"res://texture/2.png",
	"A" :"res://texture/3.png",
	"S":"res://texture/1.png"
}
var equ_type=["head","weapon","clothes"]
var equ_quality = ["B","A","S"]

func getAttrName(type):
	return attr_type[type]

func getQualityFrame(type):
	return quality_frame[type]

func createEqu(type,quality):
	var equ={
		type = "weapon",
		quality = quality,
		attr = {
			atk = 10,
			hp = 50
		},
		image = "res://texture/equ1.png",
		lv =1
	}
	return equ
