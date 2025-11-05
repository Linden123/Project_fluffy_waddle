


if(instance_exists(Obj_dialouge))exit;

if (alarm[1] >= 0)
{
	target_x = x + kb_x;
	target_y = y + kb_y;
}



var _hor = clamp(target_x - x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);

move_and_collide(_hor * move_speed, _ver * move_speed, [tilemap, Obj_enimy_parent]);

if (hp <= 0)
{
    instance_destroy();
	Obj_player.add_xp(xp_value);
}

