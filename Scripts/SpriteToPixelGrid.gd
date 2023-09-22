extends Sprite2D


const PIXELS_PER_UNIT = 1
const GRID_OFFSET = 0


func _process(delta):
    var _pos = global_position
    var _roundedPos = _pos
    _roundedPos.x = roundf(_pos.x * PIXELS_PER_UNIT) / PIXELS_PER_UNIT
    _roundedPos.x += GRID_OFFSET * sign(_roundedPos.x)
    _roundedPos.y = roundf(_pos.y * PIXELS_PER_UNIT) / PIXELS_PER_UNIT
    _roundedPos.y += GRID_OFFSET * sign(_roundedPos.y)
    offset = _roundedPos - _pos
