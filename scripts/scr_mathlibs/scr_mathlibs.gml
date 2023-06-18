function Vector2(_x, _y) constructor
{
	static Update = function(_x, _y)
	{
		x = _x;
		y = _y;
	};
	static UpdateVector = function(_vector)
	{
		x = _vector.x;
		y = _vector.y;
	};
	static Add = function(_x, _y)
	{
		x += _x;
		y += _y;
	};
	static AddVector = function(_vector)
	{
		x += _vector.x;
		y += _vector.y;
	};
	static Multiply = function(_x, _y)
	{
		x *= _x;
		y *= _y;
	};
	static Divide = function(_x, _y)
	{
		x /= _x;
		y /= _y;
	};
	static MultiplyVector = function(_vector)
	{
		x *= _vector.x;
		y *= _vector.y;
	};
	static DivideVector = function(_vector)
	{
		x /= _vector.x;
		y /= _vector.y;
	};
	x = _x;
	y = _y;
}
function magnitude(a, b)
{
	return sqrt(abs(a) + abs(b));
}

// https://forum.gamemaker.io/index.php?threads/smooth-camera-rotation.84059/
function cycle(value, min, max)
{
	var result, delta;
	delta = (max - min);
	// % is remainder-of-division operator here.
	// limit input to (-delta .. +delta):
	result = (value - min) % delta;
	// wrap negative results around the limit:
	if (result < 0) result += delta;
	// return adjusted input:
	return result + min;
}
function angle_rotate(angle, target, speed)
{
	var diff;
	// 180 is to be replaced by "pi" for radians
	diff = cycle(target - angle, -180, 180);
	// clamp rotations by speed:
	if (diff < -speed) return angle - speed;
	if (diff > speed) return angle + speed;
	// if difference within speed, rotation's done:
	return target;
}

function get_velocity(a, b)
{
	return a / b;
}
function Wave(from, to, duration, offset, time = noone)
{
	// https://forum.gamemaker.io/index.php?threads/wave-script.62475/
	var a4 = (to - from) * 0.5;
	
	var t = current_time;
	if time != noone
		t = time;
	
	return from + a4 + (sin((((t * 0.001) + (duration * offset)) / duration) * (pi * 2)) * a4);
}
function distance_to_pos(argument0, argument1, argument2, argument3, argument4, argument5)
{
	return abs(argument0 - argument2) <= argument4 && abs(argument1 - argument3) <= argument5;
}
function distance_between_points(x1, y1, x2, y2)
{
	return sqrt(sqr(x2 - x1) + sqr(y2 - y1));
}
function calculate_jump_velocity_alt(argument0, argument1, argument2, argument3)
{
	var xx = argument0 - x;
	var yy = argument1 - y;
	var g = argument3;
	var tmp = power(argument2, 4) - (g * ((g * power(xx, 2)) + (2 * yy * power(argument2, 2))));
	if (tmp > 0)
	{
		if (xx == 0)
		{
			var a1 = pi / 2;
			if (yy < 0)
				var a2 = -pi / 2;
			else
				a2 = pi / 2;
		}
		else
		{
			a1 = arctan2(power(argument2, 2) + sqrt(tmp), g * xx);
			a2 = arctan2(power(argument2, 2) - sqrt(tmp), g * xx);
		}
		hsp = cos(a1) * argument2 * 1.2;
		vsp = cos(a2) * argument2;
		if (vsp > 0)
			vsp *= -1;
		hsp = abs(hsp) * sign(xx);
	}
}
function calculate_jump_velocity(argument0, argument1, argument2, argument3)
{
	var a = get_projectile_angle(x, y, argument0, argument1, argument2, argument3);
	hsp = lengthdir_x(argument2, a);
	vsp = lengthdir_y(argument2, a);
}
function get_projectile_angle(argument0, argument1, argument2, argument3, argument4, argument5)
{
	var xt = floor(argument2 - argument0);
	var yt = -floor(argument3 - argument1);
	var root = power(argument4, 4) - (argument5 * ((argument5 * sqr(xt)) + (2 * sqr(argument4) * yt)));
	var angle = 0;
	if (root > 0)
	{
		angle = radtodeg(arctan((sqr(argument4) + sqrt(root)) / (argument5 * xt)));
		if (xt < 0)
			angle -= 180;
	}
	else if (xt > 0)
		angle = 45;
	else
		angle = 135;
	return angle;
}
