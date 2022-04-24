import Foundation

class TennisGame3: TennisGame {
    private var player1: String
    private var player2: String
    private var score1: Int
    private var score2: Int
    
    required init(player1: String, player2: String) {
        self.player1 = player1
        self.player2 = player2
        score1 = 0
        score2 = 0
    }
    
    var score: String? {
        var score: String
        if (score1 < 4 && score2 < 4) && (score1 + score2 < 6) {
            let point = ["Love", "Fifteen", "Thirty", "Forty"]
            score = point[score1]
            return (score1 == score2) ? "\(score)-All" : "\(score)-\(point[score2])"
        } else {
            if (score1 == score2) {
                return "Deuce"
            }
            score = score1 > score2 ? player1 : player2
            return ((score1 - score2) * (score1 - score2) == 1) ? "Advantage \(score)" : "Win for \(score)"
        }
    }
    
    func wonPoint(_ playerName: String) {
        if playerName == "player1" {
            score1 += 1
        } else {
            score2 += 1
        }
    }
}
