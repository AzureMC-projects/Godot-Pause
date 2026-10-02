extends CanvasLayer

@onready var panel: PanelContainer = $CenterContainer/PanelContainer
@onready var resume_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Resume
@onready var restart_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Restart
@onready var options_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Options
@onready var quit_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/Quit

func _ready() -> void:
    process_mode = Node.PROCESS_MODE_ALWAYS
    hide_menu()
    resume_button.pressed.connect(_on_resume_pressed)
    restart_button.pressed.connect(_on_restart_pressed)
    options_button.pressed.connect(_on_options_pressed)
    quit_button.pressed.connect(_on_quit_pressed)

func toggle_pause() -> void:
    if get_tree().paused:
        _on_resume_pressed()
    else:
        show_menu()

func show_menu() -> void:
    get_tree().paused = true
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
    panel.show()
    resume_button.grab_focus()

func hide_menu() -> void:
    panel.hide()

func _on_resume_pressed() -> void:
    get_tree().paused = false
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
    hide_menu()

func _on_restart_pressed() -> void:
    get_tree().paused = false
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
    get_tree().change_scene_to_file("res://Game.tscn")

func _on_options_pressed() -> void:
    get_tree().paused = false
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
    get_tree().change_scene_to_file("res://Options.tscn")

func _on_quit_pressed() -> void:
    get_tree().paused = false
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
    get_tree().change_scene_to_file("res://MainMenu.tscn")
