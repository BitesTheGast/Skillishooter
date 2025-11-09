class_name MultiplayerController extends Node

@onready var MainMenu = $"../CanvasLayer/MainMenu"
@onready var Player_scene = preload("res://player/player.tscn")

var enet_peer = ENetMultiplayerPeer.new()

func _ready() -> void:
	MainMenu.Start_Host.connect(Start_Host)
	MainMenu.Join_Server.connect(Join_Server)

func Start_Host(PORT):
	MainMenu.hide_all()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	enet_peer.create_server(PORT)
	multiplayer.multiplayer_peer = enet_peer
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(remove_player)
	
	add_player(multiplayer.get_unique_id())

func Join_Server(Ip, PORT):
	MainMenu.hide_all()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	enet_peer.create_client(Ip, PORT)
	multiplayer.multiplayer_peer = enet_peer

func add_player(peer_id):
	var player = Player_scene.instantiate()
	player.name = str(peer_id)
	add_child(player)
	if player.is_multiplayer_authority():
		player.emit_signal("add_weapon", 0)

func remove_player(peer_id):
	var player = get_node_or_null(str(peer_id))
	if player:
		player.queue_free()
