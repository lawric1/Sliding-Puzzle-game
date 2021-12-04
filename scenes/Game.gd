extends Node2D


#var pieces = get_tree().get_nodes_in_group("pieces")
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

var piecesPositions = []
var expectedPositions = []


func _ready():
	var pieces = get_tree().get_nodes_in_group("pieces")
	for index in pieces.size():
		pieces[index].get_node("sprite").texture = skin[index]
	
	shufflePieces(pieces)

func _process(_delta):
	var pieces = get_tree().get_nodes_in_group("pieces")
	for piece in pieces:
		piecesPositions.append(piece.position)
		expectedPositions.append(piece.expectedPos)
	if piecesPositions == expectedPositions:
#		print('win')
		pass

func shufflePieces(pieces):
	var possiblePositions = [Vector2(48,16)]
	for piece in pieces:
		possiblePositions.append(piece.position)
		
	randomize()
	possiblePositions.shuffle()
	
	for index in pieces.size():
		pieces[index].position = possiblePositions[index]

# Fix shuffle, Add start Button, Add Win Screen
# Last piece has to be empty, you dumbo






