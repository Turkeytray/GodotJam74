extends CharacterBody2D

var speed = 300

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	#$Camera/CanvasLayer/ColorRect.get_material().set_shader_parameter("offset", sanity)
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = speed * direction
	
	move_and_slide()
