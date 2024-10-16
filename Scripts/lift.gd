extends AnimatableBody2D

var pieces := 0
var inRadius := false
@onready var rootNode := get_parent()
@onready var interactionPopUp : CanvasLayer = rootNode.get_node("InteractionPopup")
@onready var interactTextPopUp : RichTextLabel = interactionPopUp.get_node("InteractText")

signal place

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_E) and inRadius:
		place.emit()

func _on_player_entered(body: Node2D) -> void:
	if body.name != "Player":
		return
	interactTextPopUp.show()
	inRadius = true

func _on_player_exited(body: Node2D) -> void:
	if body.name != "Player":
		return
	interactTextPopUp.hide()
	inRadius = false

func _on_player_return_pieces(piecesToFill: int) -> void:
	pieces += piecesToFill
