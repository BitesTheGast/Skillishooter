extends Control

signal Start_Host(PORT)
signal Join_Server(Ip, PORT)

@onready var Main = $CenterContainer/Main
@onready var Host = $CenterContainer/Host
@onready var Join = $CenterContainer/Join
@onready var Settings = $CenterContainer/Settings

func _on_host_button_pressed() -> void:
	hide_all()
	Host.show()


func _on_join_button_pressed() -> void:
	hide_all()
	Join.show()


func _on_settings_button_pressed() -> void:
	hide_all()
	Settings.show()


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_back_button_pressed() -> void:
	hide_all()
	Main.show()

func hide_all():
	for child in $CenterContainer.get_children():
		child.hide()


func _on_start_host_button_pressed() -> void:
	emit_signal("Start_Host", int($CenterContainer/Host/PortEdit.text))


func _on_join_server_button_pressed() -> void:
	emit_signal("Join_Server", $CenterContainer/Join/IpEdit.text, int($CenterContainer/Join/PortEdit.text))
