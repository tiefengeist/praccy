// Create a new LeaderBoard Instance

LeaderBoard leader_board = new LeaderBoard();



// Add scores for players to the LeaderBoard

leader_board.add_score(1, 50); // 50.0

leader_board.add_score(2, 80); // 80.0

leader_board.add_score(2, 70); // 75.0

leader_board.add_score(2, 60); // 70.0

leader_board.add_score(3, 90); // 90.0

leader_board.add_score(3, 85); // 87.5



// Get top positions for the leaderboard

leader_board.top(3); // [3, 2, 1]

leader_board.top(2); // [3, 2]

leader_board.top(1); // [3]



// Reset a player 3's scores

leader_board.reset(3); // void



// Player 3 is now at the bottom of the leaderboard

leader_board.top(3); // [2, 1, 3]
