
// https://github.com/arkenidar/lua-nodes

// https://github.com/gsurma/sliding_puzzle/blob/master/SlidingPuzzle/SlidingPuzzle/AI/AI.swift

/*
[BreadthFirst Search in Graph] graph/BFS
Swift code for sliding puzzle AI:
github.com/gsurma/sliding_puzzle
*/
func bfsWinningMoves() -> [ShiftDirection] {
    var queue = Queue<Node>()
    queue.enqueue(startingNode)
    var visitedNodes = Set<Node>()
    while let current = queue.dequeue() {
        if current.boardManager.getIsWinning() {
            return recreatePathFrom(node: current)
        }
        if let blankTile = current.boardManager.getBlankTile() as Tile! {
            for move in blankTile.possibleMoveDirections {
                let childNode = getChildOfNodeAndMove(node: current, move: move)
                if !visitedNodes.contains(childNode) {
                    visitedNodes.insert(current)
                    queue.enqueue(childNode)
                }
            }
        }
    }
    return []
}