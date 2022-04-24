import Foundation

class TennisGame1: TennisGame {
    private let player1: String
    private let player2: String
    private var score1: Int
    private var score2: Int
    
    required init(player1: String, player2: String) {
        self.player1 = player1
        self.player2 = player2
        self.score1 = 0
        self.score2 = 0
    }

    func wonPoint(_ playerName: String) {
        if playerName == "player1" {
            score1 += 1
        } else {
            score2 += 1
        }
    }
    
    var score: String? {
        var score = ""
        if score1 == score2 {
            score = getResultWhenBothHaveSameScore(of: score1)
        } else if score1 >= 4 || score2 >= 4 {
            score = getResultWhenOneSideHasMoreThan3(score1: score1, score2: score2)
        } else {
            score = getResultWhen(score1: score1, score2: score2)
        }
        return score
    }

    // スコアによってがスコアが同じ時のスコアボードに表示する結果を決める
    private func getResultWhenBothHaveSameScore(of score: Int) -> String {
        switch score {
        case 0:
            return "Love-All"
        case 1:
            return "Fifteen-All"
        case 2:
            return "Thirty-All"
            // 各プレイヤーが少なくとも3ポイントを獲得し、スコアが等しい場合
        default:
            return "Deuce"
        }
    }

    // 各サイドで少なくとも3ポイントが獲得され、プレーヤーが対戦相手より1ポイント多い場合
    private func getResultWhenOneSideHasMoreThan3(score1: Int, score2: Int) -> String {
        let minusResult = score1 - score2
        if minusResult == 1 {
            return "Advantage player1"
        } else if minusResult  == -1 {
            return "Advantage player2"
        } else if minusResult >= 2 {
            return "Win for player1"
        } else {
            return "Win for player2"
        }
    }

    // FIXME: 良いメソッド名が思いつかず。そもそもこういうメソッドの切り方でよかったのか？
    private func getResultWhen(score1: Int, score2: Int) -> String {
        var score = ""
        var tempScore = 0
        for i in 1..<3 {
            if i == 1 {
                tempScore = score1
            }
            else {
                score = "\(score)-"
                tempScore = score2
            }

            switch tempScore {
            case 0:
                score = "\(score)Love"
            case 1:
                score = "\(score)Fifteen"
            case 2:
                score = "\(score)Thirty"
            case 3:
                score = "\(score)Forty"
            default:
                break
            }
        }
        return score
    }
}
