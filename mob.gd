extends CharacterBody3D

signal squashed

@export var min_speed = 10.0
@export var max_speed = 18.0

func _physics_process(delta: float) -> void:
	move_and_slide()

func initialize(start_position, player_position):
	self.look_at_from_position(start_position, player_position, Vector3.UP)
	self.rotate_y(randf_range(-PI / 4, PI / 4))
	
	var random_speed = randf_range(min_speed, max_speed)
	self.velocity = Vector3.FORWARD * random_speed
	self.velocity = self.velocity.rotated(Vector3.UP, self.rotation.y)

func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	self.queue_free()

func squash():
	squashed.emit()
	queue_free()
