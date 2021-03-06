//
//  ForwardListTests.swift
//  
//
//  Created by liang on 2022-06-05.
//

import XCTest
@testable import STL

class ForwardListTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmpty() throws {
        let queue = List<Int>()
        XCTAssertEqual(true, queue.empty)
        queue.pushFront(1)
        queue.pushFront(2)
        XCTAssertEqual(false, queue.empty)
    }
    
    func testFront() throws {
        let queue = ForwardList<Int>()
        queue.pushFront(1)
        XCTAssertEqual(1, queue.front)
        queue.pushFront(2)
        XCTAssertEqual(2, queue.front)
    }
    
    func testContains() throws {
        let queue = ForwardList<Int>()
        queue.pushFront(1)
        XCTAssertEqual(1, queue.front)
        queue.pushFront(2)
        XCTAssertEqual(true, queue.contains(1))
        XCTAssertEqual(true, queue.contains(2))
        XCTAssertEqual(false, queue.contains(3))
    }
    
    func testSequence() throws {
        let list = ForwardList<Int>()
        XCTAssertEqual(true, list.empty)
        list.pushFront(1)
        list.pushFront(2)
        list.pushFront(3)
        var i = 0;
        let expect = [3, 2, 1]
        for x in list {
            XCTAssertEqual(x, expect[i])
            i += 1
        }
    }
    
    func testErase() throws {
        let list = ForwardList<Int>()
        list.pushFront(1)
        XCTAssertEqual(1, list.front)
        list.pushFront(2)
        XCTAssertEqual(2, list.front)
        list.erase(1);
        XCTAssertEqual(1, list.count)
        XCTAssertEqual(2, list.front)
    }
    
    func testBool() throws {
        let expects: [Bool] = [true, false, true]
        verifyForwardList(expects)
    }
    
    func testFloat() throws {
        let expects: [Float] = [1.0, 2.0, 3.0]
        verifyForwardList(expects)
    }
    
    func testDouble() throws {
        let expects: [Double] = [1.0, 2.0, 3.0]
        verifyForwardList(expects)
    }
    
    func testInt() throws {
        let expects: [Int] = [1, 2, 3]
        verifyForwardList(expects)
    }
    
    func testInt8() throws {
        let expects: [Int8] = [1, 2, 3]
        verifyForwardList(expects)
    }
    
    func testInt16() throws {
        let expects: [Int16] = [1, 2, 3]
        verifyForwardList(expects)
    }
    
    func testInt32() throws {
        let expects: [Int32] = [1, 2, 3]
        verifyForwardList(expects)
    }
    
    func testInt64() throws {
        let expects: [Int64] = [1, 2, 3]
        verifyForwardList(expects)
    }
    
    func testUInt() throws {
        let expects: [UInt] = [1, 2, 3]
        verifyForwardList(expects)
    }
    
    func testUInt8() throws {
        let expects: [UInt8] = [1, 2, 3]
        verifyForwardList(expects)
    }
    
    func testUInt16() throws {
        let expects: [UInt16] = [1, 2, 3]
        verifyForwardList(expects)
    }
    
    func testUInt32() throws {
        let expects: [UInt32] = [1, 2, 3]
        verifyForwardList(expects)
    }
    
    func testUInt64() throws {
        let expects: [UInt64] = [1, 2, 3]
        verifyForwardList(expects)
    }
    
    func testString() throws {
        let expects = ["abc", "def", "ghi", "jkl"]
        verifyForwardList(expects)
    }
    
    func testCGPoint() throws {
        let expects = [CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 2), CGPoint(x: 1, y: 3), CGPoint(x: 1, y: 4)]
        verifyForwardList(expects)
    }
    
    func testNSObject() throws {
        let expects = [NSObject(), NSObject()]
        verifyForwardList(expects)
    }
    
    func verifyForwardList<T: Equatable>(_ expects: [T]) {
        let queue = ForwardList<T>()
        
        XCTAssertTrue(queue.empty)
        for (i, obj) in expects.enumerated() {
            queue.pushFront(obj)
            XCTAssertEqual(expects[i], queue.front)
        }
        XCTAssertTrue(!queue.empty)
        
        var i = expects.count - 1
        while !queue.empty {
            let t: T = queue.front
            queue.popFront()
            XCTAssertEqual(expects[i], t)
            i -= 1
        }
        XCTAssertTrue(queue.empty)
    }
}
