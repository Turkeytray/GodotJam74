extends Area2D

var inRadius := false

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_E) and inRadius:
		print("Hello")

func _on_player_enter(body: Node2D) -> void:
	if body.name != "Player":
		return
	get_parent().get_parent().get_node("InteractionPopup").visible = true
	inRadius = true

func _on_player_exited(body: Node2D) -> void:
	if body.name != "Player":
		return
	get_parent().get_parent().get_node("InteractionPopup").visible = false
	inRadius = false
