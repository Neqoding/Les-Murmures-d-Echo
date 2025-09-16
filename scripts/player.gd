extends CharacterBody2D

@export var speed: float = 300.0

@onready var visuals = $Visuels
@onready var animation_player = $Visuels/Sprite_player/AnimationPlayer

# --- LOGIQUE DE DEPLACEMENT ---
@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# Gestion des animations
	if direction:
		animation_player.play("walk")
	else:
		animation_player.play("idle")
	
	# Gestion de la rotation
	if direction > 0:
		visuals.scale.x = 1
	elif direction <0:
		visuals.scale.x =-1
	
	#Gestion du mouvement
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
