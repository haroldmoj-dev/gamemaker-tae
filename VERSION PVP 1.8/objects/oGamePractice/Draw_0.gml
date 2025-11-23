draw_set_font(Font1);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_transformed(25, 25, "Level: " + string(fall_num), 1, 1, 0);
draw_text_transformed(25, 60, "Hit counter: " + string(hit_num), 1, 1, 0);