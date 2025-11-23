draw_set_font(Font1);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_transformed(25, 25, "Player Red: " + string(player1_wins), 1, 1, 0);
draw_text_transformed(25, 60, "Player Blue: " + string(player2_wins), 1, 1, 0);
/*if (oPlayer.is_dead && oPlayer2.is_dead) {
	draw_text_transformed(oHPBar.x, oHPBar.y-30, "DRAW", 1, 1, 0);
	draw_text_transformed(oHPBar2.x, oHPBar2.y-30, "DRAW", 1, 1, 0);
} else if (oPlayer.is_dead && !oPlayer2.is_dead) {
	draw_text_transformed(oHPBar.x, oHPBar.y-30, "LOSER", 1, 1, 0);
	draw_text_transformed(oHPBar2.x, oHPBar2.y-30, "WINNER", 1, 1, 0);
} else if (!oPlayer.is_dead && oPlayer2.is_dead) {
	draw_text_transformed(oHPBar.x, oHPBar.y-30, "WINNER", 1, 1, 0);
	draw_text_transformed(oHPBar2.x, oHPBar2.y-30, "LOSER", 1, 1, 0);
}*/