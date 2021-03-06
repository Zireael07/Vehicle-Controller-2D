extends "vehicle.gd"

# input 
var gas = false
var brake = false
var left = false
var right = false

# Start
func _ready():
	# Top Down Physics
	set_gravity_scale(0.0)
	
	# Added steering_damp since it may not be obvious at first glance that
	# you can simply change angular_damp to get the same effect
#	set_angular_damp(steering_damp)


# Fixed Process
func _physics_process(delta):
	# reset input
	var gas = false
	var braking = false
	var left = false
	var right = false
	
	
	# input
	if(Input.is_action_pressed("accelerate")):
		gas = true
	# Break / Reverse
	elif(Input.is_action_pressed("brake")):
		braking = true
	# Steer Left
	if(Input.is_action_pressed("steer_left")):
		left = true
	# Steer Right
	elif(Input.is_action_pressed("steer_right")):
		right = true
	
	do_physics(gas, braking, left, right, delta)
	
