if (stateTime < 100000) stateTime++;

var t = stateTime;
var cs = currentState;

if (cs == states.enemyTurn) {
	if (t == 1) {
		enemMoveOrder = [];
		with (enemy_parent) array_push(other.enemMoveOrder,id);
		enemMoveOrder = array_shuffle(enemMoveOrder);
		enemCountdown = true;
		enemMoveIndex = 0;
		enemMoveTimer = 0;
		enemiesMoving = true;
	}
	
	if (enemiesMoving and enemCountdown) {
		enemMoveTimer++;
		if (enemMoveTimer == enemMoveWait) {
			enemMoveTimer = 0;
			enemCountdown = false;
			var e = enemMoveOrder[enemMoveIndex];
			e.start_move();
			enemMoveIndex++;
			if (enemMoveIndex >= array_length(enemMoveOrder)) enemiesMoving = false;
		}
	}
	
	if (!enemiesMoving) change_state(states.playerTurn);
}