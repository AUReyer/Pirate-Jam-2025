event_inherited();

drawAngle = 0;
aiming = true;
running = false;
aimDir = 0;

runSpd = 20;

aimRange = 140;
baseDir = 0;
anglDif = 0;
aimNodeSize = 0;
aimLineLen = 0;
aimNodeSizeTrgt = 1;

aimRadius = 16;

function launch() {
	aiming = false;
	running = true;
}