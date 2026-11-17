extends CharacterBody2D

var speed = 300
@export var Fireball : PackedScene
@export var fireball_object = load("res://Fireball_Object.tscn")
@onready var main = get_tree().get_root().get_node("Node2D")
var mouse_position = get_local_mouse_position()

#@onready var main = get_tree().get_root().get_node("Node2D")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
		
	if velocity.y != 0 and velocity.x != 0:
		velocity.y = velocity.y / speed * (speed / sqrt(2))
		velocity.x = velocity.x / speed * (speed / sqrt(2))
	if Input.is_action_just_pressed("Cast"):
		Cast()
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	velocity.x = 0
	velocity.y = 0


func Cast():
	var f = fireball_object.instantiate()
		#f.z_index = $CharacterBody2D.z_index - 1
	f.dir = get_local_mouse_position().angle() + PI/2
	f.spawnPos = position
	
	f.spawnRot = get_local_mouse_position().angle()
	main.add_child.call_deferred(f)
