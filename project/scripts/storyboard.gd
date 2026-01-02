extends Node2D

@onready var camera = $Camera2D

# Export array of ScenePlayers
@export var scene_players: Array[ScenePlayer] = []

# Iterator to keep track of the current scene
var current_scene_index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Start playing the first scene
	if scene_players.size() > 0:
		_play_scene(current_scene_index)


# Custom function to handle the scene_finished signal
func _on_scene_finished(anim_name):
	print("Scene finished with animation:", anim_name)
	current_scene_index += 1
	if current_scene_index < scene_players.size():
		_play_scene(current_scene_index)
	else:
		_go_to_main_menu()


# Custom function to play a scene by index
func _play_scene(index: int):
	if index >= 0 and index < scene_players.size():
		camera.position.x = scene_players[index].position.x  # Move the camera to the scene's position
		camera.position.y = scene_players[index].position.y
		scene_players[index].play()
		scene_players[index].connect("scene_finished", Callable(self, "_on_scene_finished"))


# Custom function to go to the main menu
func _go_to_main_menu():
	Global.goto_scene("res://maps/main_menu.tscn")