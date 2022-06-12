//
//  Map.swift
//  
//
//  Created by liang on 2022-06-05.
//

import XCTest
@testable import STL

class MapTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmpty() throws {
        let queue = Map<Int, Int>()
        XCTAssertEqual(true, queue.empty)
        queue.insert((1,2))
        queue.insert((2, 3))
        XCTAssertEqual(false, queue.empty)
    }
    
    func testCount() throws {
        let queue = Map<Int, Int>()
        XCTAssertEqual(true, queue.empty)
        queue.insert((1,2))
        queue.insert((2, 3))
        XCTAssertEqual(2, queue.count)
    }
    
    func testSequence() throws {
        let queue = Map<Int, Int>()
        XCTAssertEqual(true, queue.empty)
        queue.insert((7, 2))
        queue.insert((2, 3))
        queue.insert((4, 5))
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
        let queue = Map<Int, Int>()
        XCTAssertEqual(true, queue.empty)
        queue.insert((7, 2))
        queue.insert((2, 3))
        queue.insert((4, 5))
        XCTAssertEqual(2, queue[7])
        XCTAssertEqual(3, queue[2])
        XCTAssertEqual(5, queue[4])
    }
    
    func testInsert2() throws {
        let queue = Map<Int, Int>()
        XCTAssertEqual(true, queue.empty)
        queue[7] = 2
        queue[2] = 3
        queue[4] = 5
        XCTAssertEqual(2, queue[7])
        XCTAssertEqual(3, queue[2])
        XCTAssertEqual(5, queue[4])
    }
    
    func testKeys() throws {
        let queue = Map<Int, Int>()
        XCTAssertEqual(true, queue.empty)
        queue.insert((7, 2))
        queue.insert((2, 3))
        queue.insert((4, 3))
        XCTAssertEqual([2,4,7], queue.keys)
    }

    
//    func testBool() throws {
//        let expects: [Bool] = [true, false, true]
//        verifyMap(expects)
//    }
    
    func testFloat() throws {
        let expects: [(Float, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testDouble() throws {
        let expects: [(Double, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testInt() throws {
        let expects: [(Int, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testInt8() throws {
        let expects: [(Int8, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testInt16() throws {
        let expects: [(Int16, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testInt32() throws {
        let expects: [(Int32, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testInt64() throws {
        let expects: [(Int64, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testUInt() throws {
        let expects: [(UInt, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testUInt8() throws {
        let expects: [(UInt8, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testUInt16() throws {
        let expects: [(UInt16, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testUInt32() throws {
        let expects: [(UInt32, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testUInt64() throws {
        let expects: [(UInt64, Int)] = [(7, 49),  (5, 25), (9, 81)]
        verifyMap(expects)
    }
    
    func testString() throws {
        let expects: [(String, Int)] = [
            ("def", 2),
            ("abc", 3),
            ("jkl", 4),
            ("ghi", 3),
        ]
        verifyMap(expects)
    }
    
    func testCGPoint() throws {
        let expects = [(CGPoint(x: 1, y: 1), 3), (CGPoint(x: 1, y: 2), 9), (CGPoint(x: 1, y: 3), 2), (CGPoint(x: 1, y: 4), 3)]
        verifyMap(expects)
    }
    
    func testNSObject() throws {
        let expects = [(NSObject(), 3), (NSObject(), 4)]
        verifyMap(expects)
    }
    
    func verifyMap<K: Comparable, V>(_ inputs: [(K, V)]) {
        let queue = Map<K, V>({(_ a: Any, _ b: Any) -> Bool in compareKey(a, b)})
        XCTAssertTrue(queue.empty)

        for input in inputs {
            let k: K = input.0
            let v: V = input.1
            queue[k] = v
        }

        let expects = inputs.sorted(by: {$0.0 < $1.0})
        XCTAssertTrue(!queue.empty)
        XCTAssertEqual(queue.count, expects.count)
        print(expects)
        for i in 0..<queue.count {
            let t: (K, V) = queue.nth(i)
            print(expects[i])
            XCTAssertEqual(expects[i].0, t.0)
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

extension NSObject: Comparable {
    public static func < (lhs: NSObject, rhs: NSObject) -> Bool {
        return lhs.description < rhs.description
    }
}

extension CGPoint: Comparable {
    public static func < (lhs: CGPoint, rhs: CGPoint) -> Bool {
        return lhs.y < rhs.y
    }
}
