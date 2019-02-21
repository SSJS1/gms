//reset
is_running = 0;

if!(collision_line(x,y,x,y + 8,obj_wall,1,1)){y += 4;is_in_air =1;can_jump = 0;}
else{can_jump = 1;is_in_air = 0;can_djump = 1;}

//movement
if(keyboard_check(vk_left))
{is_running = 1; if!(collision_line(x,y,x - 5 - 2,y,obj_wall,1,1)){x -= 2;}}
if(keyboard_check(vk_right))
{is_running = 1;if!(collision_line(x,y,x + 5 +2,y,obj_wall,1,1)){x += 2;}}

//jump
if(keyboard_check_pressed(ord("Z")))
{
	if(can_jump)
	{
		direction = 90 * ggravity;
		speed = 11;
		friction = 0.3;
		is_jumping = 1;
		can_jump = 0;
	}
	else
	{
		if(can_djump)
		{
			direction = 90 * ggravity;
			speed = 11;
			friction = 0.3;
			is_jumping = 0;
			can_djump = 0;
		}
	}
}
//release
if(keyboard_check_released(ord("Z"))){speed *= 0.3;}

//reset
if(keyboard_check_pressed(ord("R"))){room_restart();}

//sprite
if(is_in_air || is_jumping){sprite_index = spr_player_jump; exit;}
if(is_running){sprite_index = spr_player_run;exit;}
sprite_index = spr_player_idle;