extends Control

func _ready() -> void:
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_start_pressed() -> void:
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
    get_tree().change_scene_to_file("res://Game.tscn")

func _on_options_pressed() -> void:
    get_tree().change_scene_to_file("res://Options.tscn")

func _on_quit_pressed() -> void:
    get_tree().quit()
