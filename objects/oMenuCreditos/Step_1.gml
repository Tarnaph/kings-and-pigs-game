// Inputs
inputs = {
	up:ord("W"),
	down:ord("S"),
	jump:vk_space,
	enter:vk_enter,
}
_up = keyboard_check_pressed(inputs.up);
_down = keyboard_check_pressed(inputs.down);
_jump = keyboard_check(inputs.jump);
_enter = keyboard_check(inputs.enter);

// Game pad
if(gamepad_is_connected(0))
{
	_up = gamepad_button_check_pressed(0,gp_padu);			
	_down = gamepad_button_check_pressed(0,gp_padd);
	_jump = gamepad_button_check_pressed(0,gp_face1);			
	_enter = gamepad_button_check_pressed(0,gp_start);	
}

// Navega entre os menus
if (_up && menu_selected != 0)  {menu_selected = menu_selected -1}
if (_down && menu_selected < 4)  {menu_selected = menu_selected +1}