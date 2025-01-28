enum states {
	playerTurn,
	playerTurnExecuting,
	enemyTurn
}

sNames = ["player turn", "player turn executing","enemy turn"];
currentState = noone;
stateName = noone;
stateTime = 0;

function change_state(state) {
	currentState = state;
	stateTime = 0;
	stateName = sNames[state];
}

change_state(states.playerTurn);

//
enemMoveOrder = [];
enemMoveIndex = 0;
enemMoveTimer = 0;
enemMoveWait = 2;
enemCountdown = true;
enemiesMoving = false;