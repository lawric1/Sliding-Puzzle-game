extends Area2D

onready var tween = get_node("Tween")

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
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
	
func showPositions():
	var piecesPositions = []
	var expectedPositions = []

	var pieces = get_tree().get_nodes_in_group("pieces")
	for piece in pieces:
		piecesPositions.append(piece.position)
		expectedPositions.append(piece.expectedPos)

	print(piecesPositions)
	print(expectedPositions)
	
	if piecesPositions == expectedPositions:
		print('win')
		
		
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		targetPos = getTargetPos()
		
		if targetPos:
			move(targetPos)
			showPositions()

