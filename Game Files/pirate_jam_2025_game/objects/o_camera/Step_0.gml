camHspd = lerp(camHspd,(0-camXOffset)*0.5,0.2);
camVspd = lerp(camVspd,(0-camYOffset)*0.5,0.2);

camXOffset +=camHspd;
camYOffset +=camVspd;




var camX = camXOffset;
var camY = camYOffset;

camera_set_view_pos(cam,camX,camY);


