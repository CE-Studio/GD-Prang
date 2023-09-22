extends Node2D


@onready var SCREEN_SIZE = $"Camera2D/HUD".scale
const MAX_PICKUPS = 5
const MIN_PICKUP_TIMER = 0.25
const MAX_PICKUP_TIMER = 1.0
const MAX_ENEMIES = 8
const MIN_ENEMY_TIMER = 0.75
const MAX_ENEMY_TIMER = 2.0
const POINT_THRESHOLD_FOR_NEXT_ENEMY = 7500
const INITIAL_UMBRELLA_DELAY = 30
const ADDITIONAL_UMBRELLA_DELAY = 5


@onready var lives_icons = [
    $"Camera2D/HUD/Lives/1",
    $"Camera2D/HUD/Lives/2",
    $"Camera2D/HUD/Lives/3",
    $"Camera2D/HUD/Lives/4",
    $"Camera2D/HUD/Lives/5",
]
@onready var score_text = $"Camera2D/HUD/Score"


var lives = 2
var pickup_timer = 0.0
var enemy_timer = 0.0
static var pickup_count = 0
static var enemy_count = 0
var score = 0


signal life_lost


func _ready():
    _update_life_icons()


func _process(delta):
    if pickup_count < MAX_PICKUPS:
        pickup_timer -= delta
        if pickup_timer < 0.0:
            pickup_timer = randf_range(MIN_PICKUP_TIMER, MAX_PICKUP_TIMER)
            # Pickup spawn code here
    if enemy_count < MAX_ENEMIES:
        enemy_timer -= delta
        if enemy_timer < 0.0:
            enemy_timer = randf_range(MIN_ENEMY_TIMER, MAX_ENEMY_TIMER)
            # Enemy spawn code here


func _update_life_icons():
    for i in lives_icons.size():
        lives_icons[i].visible = i < lives


func _increment_score(add:int):
    score += add
    score_text.text = "Score\n" + score.to_string()
