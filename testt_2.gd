extends Node

func _ready():
	pass
	
	
func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_D):
		take_screenshot()
	
func take_screenshot(): # Function for taking screenshots and saving them  "_" + str(Time.get_time_string_from_system()) 
	prints("estoy screnmnd")
	var screenshot_path = "res://" + "screenshot_" +str(Time.get_date_string_from_system())  + ".jpg" # the path for our screenshot.

	var image = get_viewport().get_texture().get_image() # We get what our player sees
	
	#image.flip_y()
	image.save_jpg(screenshot_path)
