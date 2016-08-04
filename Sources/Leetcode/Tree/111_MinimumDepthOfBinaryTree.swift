//
//  111_MinimumDepthOfBinaryTree.swift
//  HRSwift
//
//  Created by yansong li on 2016-08-03.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

/**
  Given a binary tree, find its minimum depth.
 
  The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 */

class MinimumDepthOfBinaryTree_Solution {
  func minDepth(root: TreeNode?) -> Int {
    if let root = root {
      var nonLeafQueue = Queue<(TreeNode, Int)>()
      nonLeafQueue.enqueue((root, 1))
      var (currentNode, currentLevel) = nonLeafQueue.dequeue()!
      while currentNode.left != nil || currentNode.right != nil {
        if let left = currentNode.left, right = currentNode.right {
          nonLeafQueue.enqueue((left, (currentLevel + 1)))
          nonLeafQueue.enqueue((right, (currentLevel + 1)))
        } else if let left = currentNode.left {
          nonLeafQueue.enqueue((left, (currentLevel + 1)))
        } else {
          nonLeafQueue.enqueue((currentNode.right!, (currentLevel + 1)))
        }
        (currentNode, currentLevel) = nonLeafQueue.dequeue()!
      }
      return currentLevel
    }
    return 0
  }
}