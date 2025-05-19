'''
esta es la maquina de estados 
'''

extends Control
@onready var state_machine_node = $Node
var pool = 10
func _ready():
	
	state_machine_node.change_state("Idle")
	prints("el nodo no caargo")
	var node = Node2D.new()
	node.set("global_scale", Vector2(8, 2.5))
	add_child(node)
	print(node.global_scale) # Prints (8, 2.5)



func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_A):
		state_machine_node.change_state("idle")

	if Input.is_key_pressed(KEY_Q):

		state_machine_node.change_state("run")
		pass
