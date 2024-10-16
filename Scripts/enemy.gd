extends CharacterBody2D

var speed := 150
@onready var player: CharacterBody2D = get_parent().get_node("Player")
var playerNoticed := false
var direction : Vector2 = Vector2.ZERO
var lastSeenPosition : Vector2

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if playerNoticed:
		direction = (player.position - position).normalized()
		look_at(player.position)
		velocity = speed * direction
	
	if not playerNoticed and lastSeenPosition:
		direction = (lastSeenPosition - position).normalized()
		
		lastSeenPosition.length()
		
		if position.length() <= lastSeenPosition.length():
			velocity = speed * direction
			rotation = position.angle_to(lastSeenPosition)
		else:
			velocity = Vector2.ZERO
			rotation += 0.01
	
	$CollisionShape2D.rotation = -rotation
	$ColorRect.rotation = -rotation
	
	move_and_slide()

func _on_player_detected(body: Node2D) -> void:
	if body.name != "Player":
		return
	playerNoticed = true

func _on_player_lost(body: Node2D) -> void:
	if body.name != "Player":
		return
	lastSeenPosition = player.position
	playerNoticed = false
