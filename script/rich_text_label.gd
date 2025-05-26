'''
este script solo es un debug de las propiedades del nodo
'''


extends RichTextLabel

@export var nodes := Node
var scrip = null
# Called when the node enters the scene tree for the first time.
func _process(delta):
	pass#update_text()

func _ready():
	#scrip = set_script(nodes)
	#var thisScript: GDScript = $"../Node".get_script()
	#var dic_metodo = thisScript.get_signal_list()
	#prints(dic_metodo)
	update_text()
	scroll_to_line(get_line_count())

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_P):# En algún otro script o evento
		update_text()
		scroll_to_line(get_line_count())
	if Input.is_key_pressed(KEY_X):# En algún otro script o evento
		queue_free()

func update_text():
	text = ""

	var thisScript: GDScript = $"../../AnimationPlayer".get_script()
	for propertyInfo in thisScript.get_method_list():
		prints("get metodos")
		var propertyName : String = propertyInfo.name
		var propertyValue = $"../../AnimationPlayer".get(propertyName)
		var propertyType = propertyInfo.args
		var propertyReturn = propertyInfo.default_args
		text += "[color=green]%s:[/color] %s\n" % [propertyName + " " +  str(propertyReturn), propertyValue ,] if !propertyType.is_empty() else "[color=yellow]%s:[/color] %s\n" % [propertyName + " " +  str(propertyReturn), propertyValue]
		#prints(text)
		
		
		#prints(propertyInfo.args)
	for propertyInfo in thisScript.get_script_property_list():
		
		var propertyName : String = propertyInfo.name
		var propertyValue = $"../..".get(propertyName)
		var propertyType = propertyInfo.usage
		text += "[color=red]%s:[/color] %s\n" % [propertyName, propertyValue] if propertyType == 4096 else "[color=CYAN]%s:[/color] %s\n" % [propertyName, propertyValue]
		prints("properti lisrt", propertyName, propertyValue)
		
	for propertyInfo in thisScript.get_property_list():
		var propertyName : String = propertyInfo.name
		var propertyValue = $"../..".get(propertyName)
		var propertyType = propertyInfo.usage
		text += "[color=green]%s:[/color] %s\n" % [propertyName, propertyValue] if propertyType == 4096 else "[color=CORNFLOWER_BLUE]%s:[/color] %s\n" % [propertyName, propertyValue]
	
		
	for propertyInfo in thisScript.get_signal_list():
		var propertyName : String = propertyInfo.name
		var propertyValue = $"../..".get(propertyName)
		var propertyType = propertyInfo.args
		text += "[color=CORAL]%s:[/color] %s\n" % [propertyName, propertyValue] if propertyType.is_empty() else "[color=DARK_GOLDENROD]%s:[/color] %s\n" % [propertyName, propertyValue]
		#prints(propertyType)
		
		
func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		prints("Goodbye!")
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		prints("Goodbye! WINDOWS QUIT")


func _exit_tree() -> void:
	prints("adios nodo")
