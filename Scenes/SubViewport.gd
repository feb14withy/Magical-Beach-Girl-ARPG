extends SubViewport

@onready var main_level = preload("res://Scenes/main_level.tscn")

func _ready():
	pass

func _on_main_menu_start():
	var main_level_instance = main_level.instantiate()
	add_child(main_level_instance)
	get_node("Main Menu").queue_free()
	
