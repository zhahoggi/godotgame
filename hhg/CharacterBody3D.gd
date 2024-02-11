extends CharacterBody3D

	if Input.is_action_just_pressed("space"):
		var instance = load("res://node_3d.tscn")
  		instance.instantiate()
  		instance.global_position = desired_position # Меняем позицию у новой сцены на 0,0
  		"res://node_3d.tscn".add_child(instance) # тут вместо "сцена" нужно подставить ноуду, в которой у тебя будут находиться добавленные сцены, чтобы их потом можно было удобно удалять/менять/и тп. 

