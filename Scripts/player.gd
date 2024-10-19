extends CharacterBody2D

var speed := 300
var collectedPieces := 5
var running := false

signal returnPieces

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_SHIFT) and not running:
		@warning_ignore("narrowing_conversion")
		speed *= 1.75
		running = true
	if not Input.is_key_pressed(KEY_SHIFT) and running:
		@warning_ignore("narrowing_conversion")
		speed /= 1.75
		running = false
	
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

func _on_enemy_touched(body: Node2D) -> void:
	if body is Enemy:
		queue_free()
