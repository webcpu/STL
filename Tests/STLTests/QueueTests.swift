//
//  QueueTests.swift
//  
//
//  Created by liang on 2022-06-05.
//

import XCTest
@testable import STL

class QueueTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmpty() throws {
        let queue = Queue<Int>()
        XCTAssertEqual(true, queue.empty)
        queue.push(1)
        queue.push(2)
        XCTAssertEqual(false, queue.empty)
    }
    
    func testCount() throws {
        let queue = Queue<Int>()
        queue.push(1)
        queue.push(2)
        XCTAssertEqual(2, queue.count)
    }
    
    func testFront() throws {
        let queue = Queue<Int>()
        queue.push(1)
        XCTAssertEqual(1, queue.front)
    }
    
    func testBack() throws {
        let queue = Queue<Int>()
        queue.push(1)
        XCTAssertEqual(1, queue.back)
        queue.push(2)
        XCTAssertEqual(2, queue.back)
    }
    
    func testFrontBack() throws {
        let queue = Queue<Int>()
        queue.push(1)
        XCTAssertEqual(1, queue.front)
        XCTAssertEqual(1, queue.back)
        queue.push(2)
        XCTAssertEqual(1, queue.front)
        XCTAssertEqual(2, queue.back)
    }

    func testBool() throws {
        let expects: [Bool] = [true, false, true]
        verifyQueue(expects)
    }
    
    func testFloat() throws {
        let expects: [Float] = [1.0, 2.0, 3.0]
        verifyQueue(expects)
    }
    
    func testDouble() throws {
        let expects: [Double] = [1.0, 2.0, 3.0]
        verifyQueue(expects)
    }
    
    func testInt() throws {
        let expects: [Int] = [1, 2, 3]
        verifyQueue(expects)
    }
    
    func testInt8() throws {
        let expects: [Int8] = [1, 2, 3]
        verifyQueue(expects)
    }
    
    func testInt16() throws {
        let expects: [Int16] = [1, 2, 3]
        verifyQueue(expects)
    }
    
    func testInt32() throws {
        let expects: [Int32] = [1, 2, 3]
        verifyQueue(expects)
    }
    
    func testInt64() throws {
        let expects: [Int64] = [1, 2, 3]
        verifyQueue(expects)
    }
    
    func testUInt() throws {
        let expects: [UInt] = [1, 2, 3]
        verifyQueue(expects)
    }
    
    func testUInt8() throws {
        let expects: [UInt8] = [1, 2, 3]
        verifyQueue(expects)
    }
    
    func testUInt16() throws {
        let expects: [UInt16] = [1, 2, 3]
        verifyQueue(expects)
    }
    
    func testUInt32() throws {
        let expects: [UInt32] = [1, 2, 3]
        verifyQueue(expects)
    }
    
    func testUInt64() throws {
        let expects: [UInt64] = [1, 2, 3]
        verifyQueue(expects)
    }
    
    func testString() throws {
        let expects = ["abc", "def", "ghi", "jkl"]
        verifyQueue(expects)
    }
    
    func testCGPoint() throws {
        let expects = [CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 2), CGPoint(x: 1, y: 3), CGPoint(x: 1, y: 4)]
        verifyQueue(expects)
    }
    
    func testNSObject() throws {
        let expects = [NSObject(), NSObject()]
        verifyQueue(expects)
    }
    
    func verifyQueue<T: Equatable>(_ expects: [T]) {
        let queue = Queue<T>()
        XCTAssertTrue(queue.empty)
        
        expects.forEach({obj in
            queue.push(obj)
        })
        
        XCTAssertTrue(!queue.empty)
        XCTAssertEqual(queue.count, expects.count)
        for i in 0..<queue.count {
            let t: T = queue.front
            queue.pop()
            XCTAssertEqual(expects[i], t)
        }
        XCTAssertEqual(queue.count, 0)
        XCTAssertTrue(queue.empty)
    }
}
