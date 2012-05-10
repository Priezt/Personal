def move_knight(start_point, end_point, step_til_now)
	if start_point == end_point and step_til_now != 0 then return step_til_now end
	next_points = [
		[2, 1],
		[-2, 1],
		[2, -1],
		[-2, -1],
		[1, 2],
		[1, -2],
		[-1, 2],
		[-1, -2]
	].map{|x| [start_point[0] + x[0], start_point[1] + x[1]]}
	.select{|x| x[0] >= 0 and x[0] < 8 and x[1] >=0 and x[1] < 8}
	return  move_knight(next_points[Random.rand next_points.length], end_point, step_til_now + 1)
end

puts (1..10000).map{|x| move_knight([3, 3], [3, 1], 0)}.reduce(0){|s,v| s+v}/10000.0
