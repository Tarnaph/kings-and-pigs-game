draw_self();
//draw_text(x+10,y+10,_vida);
//draw_line(x, y - 14, x + visao *image_xscale, y - 15);


/* Balões */
if( estado == "dash"){ criar_balao(oPlayersIdle,s_balao_loser,30);}
if( estado == "hit"){ criar_balao(oPlayersIdle,s_balao_hit,50);}
if( estado == "pula"){ criar_balao(oPlayersIdle,s_baloes_pulo,30);}
if( estado == "morto"){ criar_balao(oPlayersIdle,s_baloes_no,30);}

/* Pet */
criar_box_skill(oPlayersIdle,s_boss_pet_idle,-15,-30);

/*Box skill  */
//if(global._timeJump <= 120) {criar_box_skill(oPlayersIdle,s_box_skill_jump_off, 0, 5); }
if(global._timeJump >= 120) {criar_box_skill(oPlayersIdle,s_box_skill_jump_on, 0, 5); }

//if(global._timeDash <= 120) {criar_box_skill(oPlayersIdle,s_box_skill_dash_off, 10, 5); }
if(global._timeDash >= 120) {criar_box_skill(oPlayersIdle,s_box_skill_dash_on, 10, 5); }

