extends Button

@export var base_icon   : String
@export var switch_icon : String

func _ready():
	connect("button_down", down)
	connect("button_up", up)

func down():
	icon = load(switch_icon)
	pass

func up():
	icon = load(base_icon)
	pass
