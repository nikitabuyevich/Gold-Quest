/// draw the mask around object
draw_self();
if (global.debug) {
    // draw rectangle of the mask around the object
    draw_set_colour(c_red);
    draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
    
    // draw the state the object is in
    draw_set_colour(c_white);
    draw_set_font(fnt_small);
    draw_text(bbox_right, bbox_top, state);
    draw_set_font(fnt_default);
}

