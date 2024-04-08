class_name hurtbox
extends Area2D

func _init() -> void:
	collision_layer = 0
	collision_mask = 2

func _ready() -> void:
	connect("area_entered", _on_area_entered)

func _on_area_entered(h: hitbox) -> void:
	if h == null:
		return
	
	if owner.has_method("take_damage"): #best practice semble plutot d'assigner tout les objets qui ont cette methode à un groupe particulier (genre " can take damage") et de verif si la node est dans le groupe
		owner.take_damage(h.damage)
	
