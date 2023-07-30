extends TextureRect

@export var type=""
@onready var equ_type = $Label
@onready var equ_image = $TextureRect
# Called when the node enters the scene tree for the first time.
func _ready():
	equ_type.text = type


func setData(equ):
	equ_type.visible = equ ==null
	if equ:
		equ_image.texture = load(equ.image)
		texture = load(ConstUtils.getQualityFrame(equ.quality))
	else:
		equ_image.texture = null
		
