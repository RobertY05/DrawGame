extends Node

const SERVER_PORT = 8080
const SERVER_IP = "127.0.0.1"

var test_player_scene = preload("res://Sandbox/TestPlayer.tscn")

func host():
	print("Hosting server at %s at port %d" % [SERVER_IP, SERVER_PORT])
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(SERVER_PORT)
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_add_player)
	multiplayer.peer_disconnected.connect(_disconnect_player)

func join():
	print("Joining server at %s at port %d" % [SERVER_IP, SERVER_PORT])
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(SERVER_IP, SERVER_PORT)
	multiplayer.multiplayer_peer = client_peer

func _add_player(id : int):
	print("Player %d joined the game" % id)
	
	var new_player = test_player_scene.instantiate()
	new_player.player_id = id
	new_player.name = str(id)
	get_tree().get_current_scene().get_node("Players").add_child(new_player, true)

func _disconnect_player(id : int):
	print("Player %d left the game" % id)
	
	if not get_tree().get_current_scene().get_node("Players").has_node(str(id)):
		return
	get_tree().get_current_scene().get_node("Players").get_node(str(id)).queue_free()
