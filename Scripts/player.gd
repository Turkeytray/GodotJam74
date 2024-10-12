extends CharacterBody2D

var speed = 300

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = speed * direction
	
	move_and_slide()
