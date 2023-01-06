// Inherit the parent event
event_inherited();

/* Balões */
if( estado == "idle"){ criar_balao(oPorcoBomber,s_balao_duvida,30);}
if( estado == "ataca"){ criar_balao(oPorcoBomber,s_baloes_atack,50);}
if( estado == "dano"){ criar_balao(oPorcoBomber,s_balao_hit,30);}
if( estado == "pegabomba"){ criar_balao(oPorcoBomber,s_baloes_no,30);}
if( estado == "morto"){ criar_balao(oPorcoBomber,s_baloes_dead,30);}


