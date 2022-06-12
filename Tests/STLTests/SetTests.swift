//
//  Map.swift
//  
//
//  Created by liang on 2022-06-05.
//

import XCTest
@testable import STL

class SetTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmpty() throws {
        let queue = STL.Set<Int>()
        XCTAssertEqual(true, queue.empty)
        queue.insert(3)
        queue.insert(2);
        XCTAssertEqual(false, queue.empty)
    }
    
    func testCount() throws {
        let queue = STL.Set<Int>()
        XCTAssertEqual(true, queue.empty)
        queue.insert(3)
        queue.insert(2)
        XCTAssertEqual(2, queue.count)
    }
    
    func testSequence() throws {
        let queue = STL.Set<Int>()
        XCTAssertEqual(true, queue.empty)
        queue.insert(7)
        queue.insert(2)
        queue.insert(4)
        for p in queue {
            print(p)
        }
        
        for p in queue {
            print(p)
        }
//        XCTAssertEqual(2, queue[7])
//        XCTAssertEqual(3, queue[2])
//        XCTAssertEqual(5, queue[4])
    }
    
    func testInsert1() throws {
        let queue = STL.Set<Int>()
        XCTAssertEqual(true, queue.empty)
        queue.insert(7)
        queue.insert(2)
        queue.insert(4)
//        XCTAssertEqual(2, queue[7])
//        XCTAssertEqual(3, queue[2])
//        XCTAssertEqual(5, queue[4])
    }
    
    
//    func testBool() throws {
//        let expects: [Bool] = [true, false, true]
//        verify(expects)
//    }
    
    func testFloat() throws {
        let expects: [Float] = [7, 5, 9]
        verify(expects)
    }
    
    func testDouble() throws {
        let expects: [Double] = [7, 5, 9]
        verify(expects)
    }
    
    func testInt() throws {
        let expects: [Int] = [7, 5, 9]
        verify(expects)
    }
    
    func testInt8() throws {
        let expects: [Int8] = [7, 5, 9]
        verify(expects)
    }
    
    func testInt16() throws {
        let expects: [Int16] = [7, 5, 9]
        verify(expects)
    }
    
    func testInt32() throws {
        let expects: [Int32] = [7, 5, 9]
        verify(expects)
    }
    
    func testInt64() throws {
        let expects: [Int64] = [7, 5, 9]
        verify(expects)
    }
    
    func testUInt() throws {
        let expects: [UInt64] = [7, 5, 9]
        verify(expects)
    }
    
    func testUInt8() throws {
        let expects: [UInt8] = [7, 5, 9]
        verify(expects)
    }
    
    func testUInt16() throws {
        let expects: [UInt16] = [7, 5, 9]
        verify(expects)
    }
    
    func testUInt32() throws {
        let expects: [UInt32] = [7, 5, 9]
        verify(expects)
    }
    
    func testUInt64() throws {
        let expects: [UInt64] = [7, 5, 9]
        verify(expects)
    }
    
    func testString() throws {
        let expects: [String] = [
            "def",
            "abc",
            "jkl",
            "ghi"
        ]
        verify(expects)
    }
    
    func testCGPoint() throws {
        let expects = [CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 2), CGPoint(x: 1, y: 3), CGPoint(x: 1, y: 4)]
        verify(expects)
    }
    
    func testNSObject() throws {
        let expects = [NSObject(), NSObject()]
        verify(expects)
    }
    
    func verify<T: Comparable>(_ inputs: [T]) {
        let queue = STL.Set<T>({(_ a: Any, _ b: Any) -> Bool in compareKey(a, b)})
        XCTAssertTrue(queue.empty)

        for elem in inputs {
            queue.insert(elem)
        }

        let expects = inputs.sorted(by: {$0 < $1})
        XCTAssertTrue(!queue.empty)
        XCTAssertEqual(queue.count, expects.count)
        print(expects)
        for i in 0..<queue.count {
            let t: T = queue.nth(i)
            print(expects[i])
            XCTAssertEqual(expects[i], t)
        }
    }
}

fileprivate func compareKey(_ a: Any, _ b: Any) -> Bool {
    precondition(type(of: a) == (type(of: b)))
    print(type(of:a))
    switch a {
    case is NSObject:
        let lhs = a as! NSObject
        let rhs = b as! NSObject
        return lhs.description < rhs.description
    case is CGPoint:
        let lhs = a as! CGPoint
        let rhs = b as! CGPoint
        return lhs < rhs
    case is String:
        let lhs = a as! String
        let rhs = b as! String
        return lhs < rhs
    case is NSNumber:
        let lhs = a as! NSNumber
        let rhs = b as! NSNumber
        return lhs.isLessThan(rhs)
    default:
        fatalError()
    }
}

//extension NSObject: Comparable {
//    public static func < (lhs: NSObject, rhs: NSObject) -> Bool {
//        return lhs.description < rhs.description
//    }
//}
//
//extension CGPoint: Comparable {
//    public static func < (lhs: CGPoint, rhs: CGPoint) -> Bool {
//        return lhs.y < rhs.y
//    }
//}
