extends Control

## The FastNoiseLite object.
@onready var noise: FastNoiseLite = $SeamlessNoiseTexture.texture.noise

# Various noise parameters.
var min_noise = -1
var max_noise = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	# Set up noise with basic info.
	$ParameterContainer/SeedSpinBox.value = noise.seed
	$ParameterContainer/FrequencySpinBox.value = noise.frequency
	$ParameterContainer/FractalOctavesSpinBox.value = noise.fractal_octaves
	$ParameterContainer/FractalGainSpinBox.value = noise.fractal_gain
	$ParameterContainer/FractalLacunaritySpinBox.value = noise.fractal_lacunarity

	# Render the noise.
	_refresh_shader_params()


func _refresh_shader_params():
	# Adjust min/max for shader.
	var _min = (min_noise + 1) / 2
	var _max = (max_noise + 1) / 2
	var _material = $SeamlessNoiseTexture.material
	_material.set_shader_parameter("min_value", _min)
	_material.set_shader_parameter("max_value", _max)


func _on_documentation_button_pressed():
	OS.shell_open("https://docs.godotengine.org/en/latest/classes/class_fastnoiselite.html")


func _on_random_seed_button_pressed():
	$ParameterContainer/SeedSpinBox.value = floor(randf_range(-2147483648, 2147483648))


func _on_seed_spin_box_value_changed(value):
	noise.seed = value


func _on_frequency_spin_box_value_changed(value):
	noise.frequency = value


func _on_fractal_octaves_spin_box_value_changed(value):
	noise.fractal_octaves = value


func _on_fractal_gain_spin_box_value_changed(value):
	noise.fractal_gain = value


func _on_fractal_lacunarity_spin_box_value_changed(value):
	noise.fractal_lacunarity = value


func _on_min_clip_spin_box_value_changed(value):
	min_noise = value
	_refresh_shader_params()


func _on_max_clip_spin_box_value_changed(value):
	max_noise = value
	_refresh_shader_params()
