view_xport[0] = random_range(-shake, shake);
view_yport[0] = random_range(-shake, shake);

shake *= .9;

if shake <= .2 
{
	instance_destroy();
}