if (alarm[0] < 0)
{
	hp -= other.damage;
	alarm[0] = 60;
	image_blend = c_red;
	
}

if (hp <= 0)
{
	instance_destroy();
    room_goto(you_died);
    alarm[1] = room_speed * 10; 
}


