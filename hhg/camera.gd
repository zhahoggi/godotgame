extends Node3D
func _ready():
	SignalBus.connect("spawned_entity", _on_entity_spawn) 
func _on_entity_spawn(pos_change, vect:Vector3 = Vector3(0, 6, 6), rotate:float = -22.4):
	get_tree().create_tween().tween_property($Camera3D, "global_position", pos_change + vect,0.3)#.set_trans(Tween.TRANS_ELASTIC)
	get_tree().create_tween().tween_property($Camera3D, "rotation_degrees", Vector3(rotate, 0, 0), 0.3)
	#self.global_position = pos_change
