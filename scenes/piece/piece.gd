extends Area2D

onready var tween = get_node("Tween")

var movementEnabled = false

export var expectedPos = Vector2(0,0)
var targetPos


func getOccupiedPositions():
	var occupiedPositions = []
	var pieces = get_tree().get_nodes_in_group("pieces")
	
	for piece in pieces:
		occupiedPositions.append(piece.position)
	
	return occupiedPositions
	
	
func withinBounds(dir):
	if 48 > dir.x or dir.x > 96:
		return false
	elif (16 > dir.y or dir.y > 64):
		return false
		
	return true
	
	
# Checks if there's an empty spot in any of the sides of piece
func getTargetPos():
	var pos = self.position
	var occupiedPositions = getOccupiedPositions()
	
	var up = Vector2(pos.x, pos.y - 16)
	var down = Vector2(pos.x, pos.y + 16)
	var left = Vector2(pos.x - 16, pos.y)
	var right = Vector2(pos.x + 16, pos.y)
	
	var directions = [up, down, left, right]
	
	for validPos in directions:
		if validPos in occupiedPositions:
			continue
		if withinBounds(validPos):
			return validPos
			
			
func move(pos):
	tween.interpolate_property(self, "position",
			self.position, pos, 0.2,
			Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	tween.start()
	
	
# Helper function for debugging
func showPositions():
	var piecesPositions = []
	var expectedPositions = []

	var pieces = get_tree().get_nodes_in_group("pieces")
	for piece in pieces:
		piecesPositions.append(piece.position)
		expectedPositions.append(piece.expectedPos)

	print(piecesPositions)
	print(expectedPositions)
	
	
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed() and movementEnabled:
		targetPos = getTargetPos()
		
		if targetPos:
			move(targetPos)

# Hover
func _on_piece_mouse_entered():
	if movementEnabled:
		$sprite.modulate = Color(1.3, 1.2, 1)

func _on_piece_mouse_exited():
	if movementEnabled:
		$sprite.modulate = Color(1, 1, 1)
