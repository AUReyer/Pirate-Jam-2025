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