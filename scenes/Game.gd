extends Node2D


#var pieces = get_tree().get_nodes_in_group("pieces")
var piecesPositions = []
var expectedPositions = []


func _ready():
	print(get_tree().get_nodes_in_group("pieces")[0].position)

func _process(_delta):
	var pieces = get_tree().get_nodes_in_group("pieces")
	for piece in pieces:
		piecesPositions.append(piece.position)
		expectedPositions.append(piece.expectedPos)

#	if piecesPositions == expectedPositions:
#		print('win')
#		yield(get_tree().create_timer(20.0), "timeout")
