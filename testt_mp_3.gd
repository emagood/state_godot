extends Node

func _ready():
	var input_path = "res://ruta/a/tu/archivo_de_audio.wav"
	var output_path = "res://ruta/a/tu/archivo_de_audio.mp3"
	var audio_data = load_audio(input_path)
	if audio_data != null:
		compress_audio(audio_data, output_path)
	else:
		print("No se pudo cargar el archivo de audio.")

func load_audio(path):
	var file = File.new()
	if file.file_exists(path):
		file.open(path, File.READ)
		var audio_data = file.get_as_text()
		file.close()
		return audio_data
	else:
		print("Archivo no encontrado: ", path)
		return null

func compress_audio(audio_data, output_path):
	var audio_stream = AudioStreamMP3.new()
	audio_stream.data = audio_data
	var mp3_data = audio_stream.save_to_buffer()
	var file = File.new()
	file.open(output_path, File.WRITE)
	file.store_buffer(mp3_data)
	file.close()
	print("Audio comprimido y guardado en: ", output_path)
