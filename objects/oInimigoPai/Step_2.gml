// Inherit the parent event
event_inherited();

// Colisao horizontal
var _col = instance_place(x + velh, y, oChao); // verifica se colidiu
if _col 
{
	// verifica se ta indo para direita
	if velh > 0
	{
		x = _col.bbox_left + (x -bbox_right); //gruda na parede
	}
	// verifica se ta indo para esquerda
	if velh < 0
	{
		x = _col.bbox_right + (x - bbox_left); //gruda na parede
	}
	// se colidir paro
	velh = 0;
}
x += velh; // direcao horizontal

// Colisao vertical
var _col = instance_place(x, y + velv, oChao); // verifica se colidiu
if _col 
{
	// verifica se ta indo para baixo
	if velv > 0
	{
		y = _col.bbox_top + (y - bbox_bottom); //gruda na parede
	}
	// verifica se ta indo para cima
	if velv < 0
	{
		y = _col.bbox_bottom + (y - bbox_top); //gruda na parede
	}
	// se colidir paro
	velv = 0;
}


y += velv; // direcao vertical


