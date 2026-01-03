extends Node2D
class_name ScenePlayer


@onready var animation_player = $AnimationPlayer

signal scene_finished(anim_name)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect the animation_finished signal to the _on_animation_finished function
	animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))


func play():
	animation_player.play("story")

# Custom function to handle the animation_finished signal
func _on_animation_finished(anim_name):
	if anim_name == "story":
		print("Animation 'story' finished playing")
		emit_signal("scene_finished", anim_name)

