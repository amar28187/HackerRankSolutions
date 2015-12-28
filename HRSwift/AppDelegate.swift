//
//  AppDelegate.swift
//  HRSwift
//
//  Created by yansong li on 2015-11-20.
//  Copyright © 2015 yansong li. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        let myTestA = "a"
        let myC = myTestA.characters[myTestA.characters.startIndex]
        print(myC.unicodeScalarCodePoint())
        
        let my2 = EncryptionModule(p: "abcdf", ep: "zabya")
        my2.calculateShifting()
    
        // Question 3
        let myTestJar = jarjarBinks()
        myTestJar.test()
        
        
        // Question 4
        let myTestPrimes = PrimeTargets()
        myTestPrimes.test()
        
        print("Binary search result: \(binarySearchLessOrEqualIndex([], target: 6))")
        
        let todayDescription = "Hi, today is Sunday"
        for i in todayDescription.characters {
            print(i)
        }
        
        let todayCount = todayDescription.characters.count
        
        print(todayDescription[todayDescription.startIndex.advancedBy(todayCount-1, limit: todayDescription.endIndex)])
        
        for i in 1..<1 {
            print(i)
        }
        
        let funnyStringTest = FunnyString()
        
        funnyStringTest.solve("acxz")
        
        let zC: Character = "z"
        print(zC.unicodeScalarCodePoint())
        
        let myFirstNode = ListNode(10)
        myFirstNode.next = ListNode(100)
        print(myFirstNode)
        
        let mySecondNode = ListNode.reverse(myFirstNode)
        print(mySecondNode)
        print(myFirstNode)
        
        let myLinkedListNode = LinkedListQueue<Int>()
        myLinkedListNode.enqueue(10)
        myLinkedListNode.enqueue(100)
        myLinkedListNode.enqueue(1000)
        myLinkedListNode.description()
        print(myLinkedListNode.isEmpty())
        
        print(myLinkedListNode.dequeue())
        print(myLinkedListNode.dequeue())
        print(myLinkedListNode.dequeue())
        print(myLinkedListNode.dequeue())
        print(myLinkedListNode.isEmpty())
        
        var myTree = AVLNode(10)
        myTree = myTree + 10
        myTree = myTree + 100
        myTree = myTree + 6
        myTree = myTree + 5
        myTree = myTree + 3
        myTree = myTree + 1
        myTree = myTree + 100
        print(myTree.description)
        myTree = (myTree - 100)!
        print(myTree.description)
        
        var myTree1 = AVLTree<Int>()
        print(myTree1.root?.description)
        
        myTree1 + 10
        myTree1 + 100
        myTree1 + 6
        myTree1 + 5
        myTree1 + 3
        myTree1 + 1
        myTree1 + 100
        print(myTree1.root?.description)
        myTree1 - 100
        print(myTree1.root?.description)
        
        //let myArray = Array(count: 5, repeatedValue: AVLTree<Int>())
        var myArray = [AVLTree<Int>]()
        myArray.append(AVLTree<Int>())
        myArray.append(AVLTree<Int>())
        myArray.append(AVLTree<Int>())
        myArray[0] + 1
        myArray[1] + 2
        myArray[2] + 3
        print(myArray[0].root?.description)
        print(myArray[1].root?.description)
        print(myArray[2].root?.description)
        let myRangeTest = SRange(start: 1100, end: 1092, step: -1)
        for i in myRangeTest {
            print("current index is \(i)")
        }
        
        // Test last non-zero digit
        print("1's last non-zero position is \(Int(1)&Int(-1))")
        print("8's last non-zero position is \(Int(8)&Int(-8))")
        print("6's last non-zero position is \(Int(6)&Int(-6))")
        
        let myBIT = BinaryIndexedTree(size: 10)
        myBIT.update(1, val: 1)
        
        let myCoins = CoinChangeProblem()
        myCoins.solveChanges([1, 2, 3], coinsCounts: 3, total: 4)
        
        var start = NSDate()
        //let myTestFibonnaci = Fibonacci(45)
        var end = NSDate()
        var timeInterval = end.timeIntervalSinceDate(start)
        //print("Fibonnaci 45 is \(myTestFibonnaci): \(timeInterval) seconds")
        
        let factorial = memoize {factorial, x in x < 2 ? x : factorial(x-1) + factorial(x - 2)}
        start = NSDate()
        let myMemoFibonnaci = factorial(45)
        end = NSDate()
        timeInterval = end.timeIntervalSinceDate(start)
        print("Fibonnaci 45 is \(myMemoFibonnaci): \(timeInterval) seconds")
        
        let myKnapSack = Knapsack()
        myKnapSack.solveWithMemo(5, K: 9, array: [3, 4, 4, 4, 8])
        
        print("Index found is \(ceilIndex([0, 1, 3,19, 20], l: -1, r: 4, key: 18))")
        print("Index found is \(ceilIndex([0, 1, 3,19, 20], l: -1, r: 4, key: -1))")
        print("Index found is \(ceilIndex([0, 1, 3,19, 20], l: -1, r: 4, key: 180))")
        print("Index found is \(ceilIndex([0, 1, 3,19, 20], l: -1, r: 4, key: 19))")
        print("Index found is \(ceilIndex([0, 1, 3,19, 20], l: 0, r: 4, key: 18))")
        
        let myLIS = LongestIncreasingSubsequence()
        myLIS.betterSolve([2, 5, 3, 7, 11, 8, 10, 13, 6])
        
        let myhex = HexagonalGrid()
        myhex.solve([[0,0],[1,1]])
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func binarySearchLessOrEqualIndex(inputs:[Int], target:Int) -> Int {
        var lowerIndex = 0
        var higherIndex = inputs.count - 1
        
        var indexToCheck = (higherIndex + lowerIndex) / 2
        while lowerIndex <= higherIndex {
            if inputs[indexToCheck] == target {
                return indexToCheck + 1
            } else if (inputs[indexToCheck] < target) {
                lowerIndex = indexToCheck + 1
                indexToCheck = (higherIndex + lowerIndex) / 2
            } else {
                higherIndex = indexToCheck - 1
                indexToCheck = (higherIndex + lowerIndex) / 2
            }
        }
        
        // At this point our lower exceed higher
        return higherIndex + 1
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

