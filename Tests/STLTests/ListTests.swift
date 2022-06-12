//
//  List.swift
//  
//
//  Created by liang on 2022-06-05.
//

import XCTest
@testable import STL

class ListTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmpty() throws {
        let queue = List<Int>()
        XCTAssertEqual(true, queue.empty)
        queue.push_back(1)
        queue.push_back(2)
        XCTAssertEqual(false, queue.empty)
    }
    
    func testCount() throws {
        let queue = List<Int>()
        queue.push_back(1)
        queue.push_back(2)
        XCTAssertEqual(2, queue.count)
    }
    
    func testFront() throws {
        let queue = List<Int>()
        queue.push_front(1)
        XCTAssertEqual(1, queue.front())
        queue.push_front(2)
        XCTAssertEqual(2, queue.front())
    }
    
    func testBack() throws {
        let queue = List<Int>()
        queue.push_back(1)
        XCTAssertEqual(1, queue.back())
        queue.push_back(2)
        XCTAssertEqual(2, queue.back())
    }
    
    func testBool() throws {
        let expects: [Bool] = [true, false, true]
        verifyList(expects)
    }
    
    func testFloat() throws {
        let expects: [Float] = [1.0, 2.0, 3.0]
        verifyList(expects)
    }
    
    func testDouble() throws {
        let expects: [Double] = [1.0, 2.0, 3.0]
        verifyList(expects)
    }
    
    func testInt() throws {
        let expects: [Int] = [1, 2, 3]
        verifyList(expects)
    }
    
    func testInt8() throws {
        let expects: [Int8] = [1, 2, 3]
        verifyList(expects)
    }
    
    func testInt16() throws {
        let expects: [Int16] = [1, 2, 3]
        verifyList(expects)
    }
    
    func testInt32() throws {
        let expects: [Int32] = [1, 2, 3]
        verifyList(expects)
    }
    
    func testInt64() throws {
        let expects: [Int64] = [1, 2, 3]
        verifyList(expects)
    }
    
    func testUInt() throws {
        let expects: [UInt] = [1, 2, 3]
        verifyList(expects)
    }
    
    func testUInt8() throws {
        let expects: [UInt8] = [1, 2, 3]
        verifyList(expects)
    }
    
    func testUInt16() throws {
        let expects: [UInt16] = [1, 2, 3]
        verifyList(expects)
    }
    
    func testUInt32() throws {
        let expects: [UInt32] = [1, 2, 3]
        verifyList(expects)
    }
    
    func testUInt64() throws {
        let expects: [UInt64] = [1, 2, 3]
        verifyList(expects)
    }
    
    func testString() throws {
        let expects = ["abc", "def", "ghi", "jkl"]
        verifyList(expects)
    }
    
    func testCGPoint() throws {
        let expects = [CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 2), CGPoint(x: 1, y: 3), CGPoint(x: 1, y: 4)]
        verifyList(expects)
    }
    
    func testNSObject() throws {
        let expects = [NSObject(), NSObject()]
        verifyList(expects)
    }
    
    func verifyList<T: Equatable>(_ expects: [T]) {
        let queue = List<T>()
        XCTAssertTrue(queue.empty)
        
        for (i, obj) in expects.enumerated() {
            queue.push_back(obj)
            XCTAssertEqual(expects[i], queue.back())
        }
        
        XCTAssertTrue(!queue.empty)
        XCTAssertEqual(queue.count, expects.count)
        for i in Array(0..<queue.count).reversed() {
            let t: T = queue.back()
            queue.pop_back()
            XCTAssertEqual(expects[i], t)
        }
        XCTAssertEqual(queue.count, 0)
        XCTAssertTrue(queue.empty)
        
        for (i, obj) in expects.enumerated() {
            queue.push_front(obj)
            XCTAssertEqual(expects[i], queue.front())
        }
        
        XCTAssertTrue(!queue.empty)
        XCTAssertEqual(queue.count, expects.count)
        for i in Array(0..<queue.count).reversed() {
            let t: T = queue.front()
            queue.pop_front()
            XCTAssertEqual(expects[i], t)
        }
        XCTAssertEqual(queue.count, 0)
        XCTAssertTrue(queue.empty)
        
        
    }
}