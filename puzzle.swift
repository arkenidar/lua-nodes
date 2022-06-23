
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

    private func recreatePathFrom(node: Node) -> [ShiftDirection] {
        var moves = [ShiftDirection]()
        func getMovesFrom(node: Node) -> [ShiftDirection] {
            if let previousMove = node.previousMove as ShiftDirection?, let previousNode = node.previousNode as Node? {
                moves.append(previousMove)
                return getMovesFrom(node: previousNode)
            } else {
                return moves
            }
        }
        return getMovesFrom(node: node).reversed()
    }
    
    private func getChildOfNodeAndMove(node: Node, move: ShiftDirection) -> Node {
        let childNode = Node(grid: node.boardManager.getGridCopy(), size: node.size)
        childNode.boardManager.shift(direction: move, delegate: nil, completionBlock: { })
        childNode.previousMove = move
        childNode.previousNode = node
        return childNode
    }
