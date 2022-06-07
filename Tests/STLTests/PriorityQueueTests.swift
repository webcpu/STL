//
//  PriorityQueue.swift
//  
//
//  Created by liang on 2022-06-05.
//

import XCTest
@testable import STL

class PriorityQueueTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmpty() throws {
        let queue = PriorityQueue<Int>()
        XCTAssertEqual(true, queue.empty)
        queue.push(1)
        queue.push(2)
        XCTAssertEqual(false, queue.empty)
    }
    
    func testCount() throws {
        let queue = PriorityQueue<Int>()
        queue.push(1)
        queue.push(2)
        XCTAssertEqual(2, queue.count)
    }
    
    func testTop() throws {
        let queue = PriorityQueue<Int>()
        queue.push(1)
        XCTAssertEqual(1, queue.top())
        queue.push(2)
        XCTAssertEqual(2, queue.top())
    }
    
//    func testBool() throws {
//        let expects: [Bool] = [true, false, true]
//        verifyPriorityQueue(expects)
//    }
    
    func testFloat() throws {
        let expects: [Float] = [1.0, 2.0, 3.0]
        verifyPriorityQueue(expects)
    }
    
    func testDouble() throws {
        let expects: [Double] = [1.0, 2.0, 3.0]
        verifyPriorityQueue(expects)
    }
    
    func testInt() throws {
        let expects: [Int] = [1, 2, 3]
        verifyPriorityQueue(expects)
    }
    
    func testInt8() throws {
        let expects: [Int8] = [1, 2, 3]
        verifyPriorityQueue(expects)
    }
    
    func testInt16() throws {
        let expects: [Int16] = [1, 2, 3]
        verifyPriorityQueue(expects)
    }
    
    func testInt32() throws {
        let expects: [Int32] = [1, 2, 3]
        verifyPriorityQueue(expects)
    }
    
    func testInt64() throws {
        let expects: [Int64] = [1, 2, 3]
        verifyPriorityQueue(expects)
    }
    
    func testUInt() throws {
        let expects: [UInt] = [1, 2, 3]
        verifyPriorityQueue(expects)
    }
    
    func testUInt8() throws {
        let expects: [UInt8] = [1, 2, 3]
        verifyPriorityQueue(expects)
    }
    
    func testUInt16() throws {
        let expects: [UInt16] = [1, 2, 3]
        verifyPriorityQueue(expects)
    }
    
    func testUInt32() throws {
        let expects: [UInt32] = [1, 2, 3]
        verifyPriorityQueue(expects)
    }
    
    func testUInt64() throws {
        let expects: [UInt64] = [1, 2, 3]
        verifyPriorityQueue(expects)
    }
    
    func testString() throws {
        let expects = ["abc", "def", "ghi", "jkl"]
        verifyPriorityQueue(expects)
    }
    
//    func testCGPoint() throws {
//        let expects = [CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 2), CGPoint(x: 1, y: 3), CGPoint(x: 1, y: 4)]
//        verifyPriorityQueue(expects)
//    }
    
    func testNSObject() throws {
        let expects = [NSObject(), NSObject()]
//        verifyPriorityQueue(expects.sorted(by: (<)))
    }
    
    
    func verifyPriorityQueue<T: Comparable>(_ inputs: [T]) {
        let queue = PriorityQueue<T>({(_ a: Any, _ b: Any) -> Bool in compareF(a as! Any, b)})
        XCTAssertTrue(queue.empty)
        
        inputs.forEach({obj in
            queue.push(obj)
        })
        
        let expects = inputs.sorted(by: {$0 > $1})
        XCTAssertTrue(!queue.empty)
        XCTAssertEqual(queue.count, expects.count)
        print(expects)
        for i in 0..<queue.count {
            let t: T = queue.top()
            queue.pop()
            print(expects[i])
            XCTAssertEqual(expects[i], t)
        }
        XCTAssertEqual(queue.count, 0)
        XCTAssertTrue(queue.empty)
    }
}

fileprivate func compareF(_ a: Any, _ b: Any) -> Bool {
    if (a is String) {
        let lhs: String = a as! String
        let rhs: String = b as! String
        return lhs < rhs
    } else {
        let lhs: Int = a as! Int
        let rhs: Int = b as! Int
        return lhs < rhs
    }
}
