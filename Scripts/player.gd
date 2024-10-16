extends CharacterBody2D

var speed := 300
var collectedPieces := 5

signal returnPieces

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"):
		$PlayerSprite.play()
	else:
		$PlayerSprite.stop()
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = speed * direction
	
	move_and_slide()

func _on_lift_place():
	if collectedPieces < 0:
		return
	returnPieces.emit(collectedPieces)
	collectedPieces = 0
