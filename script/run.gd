
extends Node



func _ready() -> void:
	prints(self.name)



func on_enter():
	print("Entered " + str(self.name) + " State")
	



# Repeat for other states (e.g., RunningState, JumpingState, etc.)

func _run(delta):
	#prints("ema" , self.name)
	pass
