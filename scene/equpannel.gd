extends NinePatchRect

@onready var equ_name =$TextureRect3/Label
@onready var equ_frame = $TextureRect2
@onready var equ_image = $TextureRect2/TextureRect4
@onready var equ_attr = $TextureRect3/ScrollContainer/VBoxContainer
@onready var equ_attr_label = $TextureRect3/ScrollContainer/VBoxContainer/Label
var equ_data

func _ready()->void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) ->void:
	pass

func setData(equ_data):
	self.equ_data= equ_data
	if equ_data:
		reload()


func reload():
	equ_name.text = "[%s] %s" %[equ_data.quality,equ_data.type]
	equ_image.texture = load(equ_data.image)
	equ_frame.texture = load(ConstUtils.getQualityFrame(equ_data.quality))
	for item in equ_data.attr:
		var equ_label:Label = equ_attr_label.duplicate()
		equ_label.visible =true
		equ_label.text = "%s %s" %[ConstUtils.getAttrName(item),equ_data.attr[item]]
		equ_attr.add_child(equ_label)
		


func _on_button_pressed():
	PlayerData.equ_up(equ_data)
	get_parent().queue_free()
