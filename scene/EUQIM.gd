extends Control

@onready var equ_panel = $EQUPANNEL
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setData(data):
	equ_panel.setData(data)


func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
			queue_free()
