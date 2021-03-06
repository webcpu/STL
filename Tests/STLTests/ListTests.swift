//
//  ListTests.swift
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
        let list = List<Int>()
        XCTAssertEqual(true, list.empty)
        list.pushBack(1)
        list.pushBack(2)
        XCTAssertEqual(false, list.empty)
    }
    
    func testCount() throws {
        let list = List<Int>()
        list.pushBack(1)
        list.pushBack(2)
        XCTAssertEqual(2, list.count)
    }
    
    func testContains() throws {
        let list = List<Int>()
        list.pushBack(1)
        list.pushBack(2)
        XCTAssertEqual(true, list.contains(2))
        XCTAssertEqual(false, list.contains(5))
    }
    
    func testFront() throws {
        let list = List<Int>()
        list.pushFront(1)
        XCTAssertEqual(1, list.front)
        list.pushFront(2)
        XCTAssertEqual(2, list.front)
    }
    
    func testBack() throws {
        let list = List<Int>()
        list.pushBack(1)
        XCTAssertEqual(1, list.back)
        list.pushBack(2)
        XCTAssertEqual(2, list.back)
    }
   
    func testSequence() throws {
        let list = List<Int>()
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
        let list = List<Int>()
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
        let list = List<T>()
        XCTAssertTrue(list.empty)
        
        for (i, obj) in expects.enumerated() {
            list.pushBack(obj)
            XCTAssertEqual(expects[i], list.back)
        }
        
        XCTAssertTrue(!list.empty)
        XCTAssertEqual(list.count, expects.count)
        for i in Array(0..<list.count).reversed() {
            let t: T = list.back
            list.popBack()
            XCTAssertEqual(expects[i], t)
        }
        XCTAssertEqual(list.count, 0)
        XCTAssertTrue(list.empty)
        
        for (i, obj) in expects.enumerated() {
            list.pushFront(obj)
            XCTAssertEqual(expects[i], list.front)
        }
        
        XCTAssertTrue(!list.empty)
        XCTAssertEqual(list.count, expects.count)
        for i in Array(0..<list.count).reversed() {
            let t: T = list.front
            list.popFront()
            XCTAssertEqual(expects[i], t)
        }
        XCTAssertEqual(list.count, 0)
        XCTAssertTrue(list.empty)
    }
}
