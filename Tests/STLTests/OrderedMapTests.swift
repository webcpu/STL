//
//  OrderedMapTests.swift
//  
//
//  Created by liang on 2022-06-05.
//

import XCTest
@testable import STL

class OrderedMapTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmpty() throws {
        let m = OrderedMap<Int, Int>()
        XCTAssertEqual(true, m.empty)
        m.insert((1, 2))
        m.insert((2, 3))
        XCTAssertEqual(false, m.empty)
    }
    
    func testCount() throws {
        let m = OrderedMap<Int, Int>()
        XCTAssertEqual(true, m.empty)
        m.insert((1, 2))
        m.insert((2, 3))
        XCTAssertEqual(2, m.count)
    }
    
    func testSequence() throws {
        let m = OrderedMap<Int, Int>()
        XCTAssertEqual(true, m.empty)
        m.insert((7, 2))
        m.insert((2, 3))
        m.insert((4, 5))
        
        XCTAssertEqual(m.keys, [2,4,7])
    }
    
    func testInsert1() throws {
        let m = OrderedMap<Int, Int>()
        XCTAssertEqual(true, m.empty)
        m.insert((7, 2))
        m.insert((2, 3))
        m.insert((4, 5))
        XCTAssertEqual(2, m[7])
        XCTAssertEqual(3, m[2])
        XCTAssertEqual(5, m[4])
    }
    
    func testInsert2() throws {
        let m = OrderedMap<Int, Int>()
        XCTAssertEqual(true, m.empty)
        m[7] = 2
        m[2] = 3
        m[4] = 5
        XCTAssertEqual(2, m[7])
        XCTAssertEqual(3, m[2])
        XCTAssertEqual(5, m[4])
        XCTAssertEqual(m.keys, [2, 4, 7])
        XCTAssertEqual(m.values, [3, 5, 2])
    }
    
    func testKeys() throws {
        let m = OrderedMap<Int, Int>()
        XCTAssertEqual(true, m.empty)
        m.insert((7, 2))
        m.insert((2, 3))
        m.insert((4, 3))
        XCTAssertEqual([2,4,7], m.keys)
    }
    
    func testValues() throws {
        let m = OrderedMap<Int, Int>()
        XCTAssertEqual(true, m.empty)
        m.insert((7, 2))
        m.insert((2, 3))
        m.insert((4, 3))
        XCTAssertEqual([3, 3, 2], m.values)
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
        let m = OrderedMap<K, V>({(_ a: Any, _ b: Any) -> Bool in compareKey(a, b)})
        XCTAssertTrue(m.empty)

        for input in inputs {
            let k: K = input.0
            let v: V = input.1
            m[k] = v
        }

        let expects = inputs.sorted(by: {$0.0 < $1.0})
        XCTAssertTrue(!m.empty)
        XCTAssertEqual(m.count, expects.count)
        print(expects)
        for i in 0..<m.count {
            let t: (K, V) = m.nth(i)
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
