extends StaticBody2D

onready var ray = $RayCast2D
onready var fire = $FireSprite
onready var laser = $Line2D	

export (float) var rotationSpeed = 0.5
export (float) var startDegree = 90
export (int) var laserLenght = 60

func _physics_process(_delta):
	var endPoint = GetEndPoint()
	ray.cast_to = endPoint
	if ray.is_colliding():
		var collidingPlace = ray.get_collision_point()
		fire.position = collidingPlace - global_position
		fire.visible = true
		laser.points[1] = fire.position
	else :
		fire.visible = false
		laser.points[1] = endPoint
		
	startDegree += rotationSpeed
	

func GetEndPoint():
	var radian = startDegree * PI / 180
	var newX = cos(radian) * laserLenght
	var newY = sin(radian) * laserLenght
	return Vector2(newX,newY)
