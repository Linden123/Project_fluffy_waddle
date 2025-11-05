if (instance_exists(Obj_dialouge)) exit;

if (instance_exists(Obj_player) && distance_to_object(Obj_player) < 20.67)
{ 
	can_talk = true;
	if (keyboard_check_pressed(input_key))
	{
		create_dialouge(dialouge);
	}
}
else
{
	can_talk = false;
}
