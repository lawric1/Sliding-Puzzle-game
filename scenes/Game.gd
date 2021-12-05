extends Node2D

var skin = [
	load('res://scenes/piece/skin1/piece1.png'),
	load('res://scenes/piece/skin1/piece2.png'),
	load('res://scenes/piece/skin1/piece3.png'),
	load('res://scenes/piece/skin1/piece4.png'),
	load('res://scenes/piece/skin1/piece5.png'),
	load('res://scenes/piece/skin1/piece6.png'),
	load('res://scenes/piece/skin1/piece7.png'),
	load('res://scenes/piece/skin1/piece8.png'),
	load('res://scenes/piece/skin1/piece9.png'),
	load('res://scenes/piece/skin1/piece10.png'),
	load('res://scenes/piece/skin1/piece11.png'),
	load('res://scenes/piece/skin1/piece12.png'),
	load('res://scenes/piece/skin1/piece13.png'),
	load('res://scenes/piece/skin1/piece14.png'),
	load('res://scenes/piece/skin1/piece15.png')	
]


func _ready():
	var pieces = get_tree().get_nodes_in_group("pieces")
	for index in pieces.size():
		pieces[index].get_node("sprite").texture = skin[index]
	
func _process(_delta):
	var piecesPositions = []
	var expectedPositions = []
	
	var pieces = get_tree().get_nodes_in_group("pieces")
	for piece in pieces:
		piecesPositions.append(piece.position)
		expectedPositions.append(piece.expectedPos)
	if piecesPositions == expectedPositions:
		print('win')

func shufflePieces(pieces):
	var possiblePositions = []
	for piece in pieces:
		possiblePositions.append(piece.position)
		
	randomize()
	possiblePositions.shuffle()
	
	for index in pieces.size():
		pieces[index].position = possiblePositions[index]


func _on_startButton_pressed():
	var pieces = get_tree().get_nodes_in_group("pieces")
	for piece in pieces:
		piece.position = piece.expectedPos
	shufflePieces(pieces)

# Hover texture to pieces or shader
# When start is pressed change texture to stop, shuffle pieces and enable winning condition.
# Stop resets original state, disable input on pieces and disable winning condition
# Add Win Screen
	
