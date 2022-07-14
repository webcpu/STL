//
//  OrderedSetTests.swift
//  
//
//  Created by liang on 2022-06-05.
//

import XCTest
@testable import STL

class OrderedSetTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmpty() throws {
        let set = STL.OrderedSet<Int>()
        XCTAssertEqual(true, set.empty)
        set.insert(3)
        set.insert(2);
        XCTAssertEqual(false, set.empty)
    }
    
    func testContains() throws {
        let set = STL.OrderedSet<Int>()
        XCTAssertEqual(true, set.empty)
        set.insert(3)
        set.insert(2)
        XCTAssertEqual(true, set.contains(2))
        XCTAssertEqual(false, set.contains(4))
    }
    
    func testCount() throws {
        let set = STL.OrderedSet<Int>()
        XCTAssertEqual(true, set.empty)
        set.insert(3)
        set.insert(2)
        XCTAssertEqual(2, set.count)
    }
    
    func testSequence() throws {
        let set = STL.OrderedSet<Int>()
        XCTAssertEqual(true, set.empty)
        set.insert(7)
        set.insert(2)
        set.insert(4)
        var i = 0;
        let expect = [2, 4, 7]
        for x in set {
            XCTAssertEqual(x, expect[i])
            i += 1
        }
    }
    
    func testInsert1() throws {
        let set = STL.OrderedSet<Int>({(_ a: Any, _ b: Any) -> Bool in (a as! Int) > (b as! Int)})
        XCTAssertEqual(true, set.empty)
        set.insert(7)
        set.insert(2)
        set.insert(2)
        set.insert(6)
        var i = 0;
        let expect = [7, 6, 2]
        for x in set {
            XCTAssertEqual(x, expect[i])
            i += 1
        }
    }
    
    func testIntersection() throws {
        let s1 = STL.OrderedSet<Int>({(_ a: Any, _ b: Any) -> Bool in (a as! Int) > (b as! Int)})
        s1.insert(7)
        s1.insert(2)
        s1.insert(2)
        s1.insert(6)
        
        let s2 = STL.OrderedSet<Int>({(_ a: Any, _ b: Any) -> Bool in (a as! Int) > (b as! Int)})
        s2.insert(1)
        s2.insert(2)
        s2.insert(6)
        s2.insert(4)
        let s = s1.intersection(s2)
        
        var i = 0;
        let expect = [2, 6]
        
        for x in s {
            XCTAssertEqual(x, expect[i])
            i += 1
        }
    }
    
    func testUnion() throws {
        let s1 = STL.OrderedSet<Int>({(_ a: Any, _ b: Any) -> Bool in (a as! Int) > (b as! Int)})
        s1.insert(7)
        s1.insert(2)
        s1.insert(2)
        s1.insert(6)
        
        let s2 = STL.OrderedSet<Int>({(_ a: Any, _ b: Any) -> Bool in (a as! Int) > (b as! Int)})
        s2.insert(1)
        s2.insert(2)
        s2.insert(6)
        s2.insert(4)
        let s = s1.union(s2)
        
        var i = 0;
        let expect = [1, 2, 4, 6, 7]
        
        for x in s {
            XCTAssertEqual(x, expect[i])
            i += 1
        }
    }
    
    func testComplement() throws {
        let s1 = STL.OrderedSet<Int>({(_ a: Any, _ b: Any) -> Bool in (a as! Int) > (b as! Int)})
        s1.insert(7)
        s1.insert(2)
        s1.insert(2)
        s1.insert(6)
        
        let s2 = STL.OrderedSet<Int>({(_ a: Any, _ b: Any) -> Bool in (a as! Int) > (b as! Int)})
        s2.insert(1)
        s2.insert(2)
        s2.insert(6)
        s2.insert(4)
        let s = s1.complement(s2)
        
        var i = 0;
        let expect = [7]
        
        for x in s {
            XCTAssertEqual(x, expect[i])
            i += 1
        }
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
        let set = STL.OrderedSet<T>({(_ a: Any, _ b: Any) -> Bool in compareKey(a, b)})
        XCTAssertTrue(set.empty)

        for elem in inputs {
            set.insert(elem)
        }

        let expects = inputs.sorted(by: {$0 < $1})
        XCTAssertTrue(!set.empty)
        XCTAssertEqual(set.count, expects.count)
        print(expects)
        for i in 0..<set.count {
            let t: T = set.nth(i)
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
