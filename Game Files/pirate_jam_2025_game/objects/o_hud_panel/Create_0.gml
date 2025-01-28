event_inherited();
depthCoord = hud_depth;

var hudCenterX = grid_w+(room_width-grid_w)/2;

create(hudCenterX-40,100,o_player_armor);
create(hudCenterX+40,100,o_player_hp);