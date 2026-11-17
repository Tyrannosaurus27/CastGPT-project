extends CharacterBody2D
var speed = 1000

var dir = 0.0
var spawnPos : Vector2
var spawnRot = 0.0
var damage



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawnPos
	global_rotation = spawnRot
	damage = 1
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = Vector2(0,-speed).rotated(dir)
	move_and_slide()
	if sqrt((position.x - spawnPos.x) ** 2 + (position.y - spawnPos.y) ** 2) >= 500:
		print("fish")
		queue_free()
	
	


#func _on_area_2d_area_entered(area: Area2D) -> void:
	#if area.is_in_group("Enemy"):
		#area.enemy_hurt(damage)
