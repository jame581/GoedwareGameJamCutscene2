extends Node

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var panel: Panel = $Panel

var current_scene = null
var current_path : String = ""
var mouse_check_enabled: bool = false


func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	current_path = current_scene.scene_file_path

	panel.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)


func get_version() -> String:
	return "Version: " + ProjectSettings.get_setting("application/config/version")


func goto_main_menu():
	goto_scene("res://maps/main_menu.tscn")


func goto_scene(path):
	current_path = path
	animation_player.play("fade_in")


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)
	animation_player.play("fade_out")

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene


func play_transition_animation(animation_name: String) -> void:
	animation_player.play(animation_name)


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_in":
		call_deferred("_deferred_goto_scene", current_path)


func set_mouse_check_enabled(enabled: bool) -> void:
	mouse_check_enabled = enabled


func is_mouse_check_enabled() -> bool:
	return mouse_check_enabled
