// Inherit the parent event
event_inherited();

draw_self();

/* Balões */
if( estado == "idle"){ criar_balao(oPorco,s_balao_duvida,30);}
if( estado == "ataca"){ criar_balao(oPorco,s_baloes_atack,50);}
if( estado == "dano"){ criar_balao(oPorco,s_balao_hit,30);}
if( estado == "ligacanhao"){ criar_balao(oPorco,s_baloes_bomm,20);}
if( estado == "pegabomba"){ criar_balao(oPorco,s_baloes_no,30);}
if( estado == "morto"){ criar_balao(oPorco,s_baloes_no,30);}