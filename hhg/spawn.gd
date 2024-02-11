extends Node3D
var desired_position := Vector3(0,0,0)
var desired_position_camera := Vector3(0,0,0)
var distance_to_new_instance_x := Vector3(5,0,0) # Дистанция до новой сцены
var distance_to_new_instance_z := Vector3(-25,0,5) # Дистанция до новой сцены
var yu = 0.0
var k := 0;
var current_pos:Vector3
func spawn(): 
	randomize()
	var randomizer = randi()%3
	if randomizer == 0:
		var instance1 = load("res://cubespawn.tscn").instantiate()
		get_node("/root/world/spawner").add_child(instance1)
		instance1.position = desired_position
		SignalBus.emit_signal("spawned_entity", instance1.global_position)
	if randomizer == 1:
		var instance2 = load("res://tree.tscn").instantiate()
		get_node("/root/world/spawner").add_child(instance2)
		instance2.position = desired_position
		SignalBus.emit_signal("spawned_entity", instance2.global_position)
	if randomizer == 2:
		var instance3 = load("res://spruce.tscn").instantiate()
		get_node("/root/world/spawner").add_child(instance3)
		instance3.position = desired_position
		SignalBus.emit_signal("spawned_entity", instance3.global_position)
	k+=1
	desired_position += distance_to_new_instance_x
	if k % 5 == 0:
		desired_position += distance_to_new_instance_z
	print(k)
func top_view():
	SignalBus.emit_signal("spawned_entity", Vector3(0, 0, 0), Vector3(0, 23, 0), -90)

func _process(delta):
	if Input.is_action_just_pressed("space"):
		spawn()
	if Input.is_action_just_pressed("shift"):
		top_view()
