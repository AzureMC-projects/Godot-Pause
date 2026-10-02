extends Node3D

@onready var pause_menu: CanvasLayer = $PauseMenu

func _ready() -> void:
    get_tree().paused = false
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_cancel"):
        pause_menu.toggle_pause()
        get_viewport().set_input_as_handled()
