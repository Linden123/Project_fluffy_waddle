if (alarm[1] < 0)
{
	hp -= other.damage;
	image_blend = c_red;
	
	kb_x = sign(x - other.y);
	kb_y = sign(y - other.x);
	alarm[1] = 20;
}