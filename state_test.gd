extends Control
@onready var state_machine_node = $Node

func _ready():
	
	state_machine_node.change_state("Idle")
	prints("el nodo no caargo")



func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_A):# En algún otro script o evento
		state_machine_node.change_state("idle")

	if Input.is_key_pressed(KEY_Q):# En algún otro script o evento

		state_machine_node.change_state("run")
		pass
