# StateMachine.gd
extends Node

# Lista de estados
#var states = []
var node = {}
# Estado actual
var current_state = null

func _ready():
	for state in get_children():
		if state.has_method("on_enter"):
			node[state.name] = state
			#states.append(state)


func change_state(state_name):
	if node.has(state_name):
		current_state = node[state_name]
		current_state.on_enter()
		prints(" si esta en diionario")
	else:
		print("el state no exixte: ", state_name)
	


func _process(delta):
	if current_state:
		current_state._run(delta)
