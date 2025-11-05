// Always clear background
draw_clear_alpha(c_black, 1);

// Get camera size
var cam = view_camera[0];
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

// Get sprite size
var spr_w = sprite_get_width(sprite_index);
var spr_h = sprite_get_height(sprite_index);

// Scale sprite to fill camera view
var scale_x = cam_w / spr_w;
var scale_y = cam_h / spr_h;

// Draw at top-left of camera view
draw_sprite_ext(sprite_index, image_index, 0, 0, scale_x, scale_y, 0, c_white, 1);
