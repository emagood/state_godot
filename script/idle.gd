# IdleState.gd
extends Node



func _ready() -> void:
	prints(self.name)



func on_enter():
	print("Entered Idle State")
	


# Repeat for other states (e.g., RunningState, JumpingState, etc.)

func _run(delta):
	#prints("ema ", self.name)
	pass
