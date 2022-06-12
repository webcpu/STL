import CxxSTL

fileprivate func compareFunction(_ a: Any, _ b: Any) -> Bool {
    precondition(type(of: a) == (type(of: b)))
    print(type(of:a))
    switch a {
    case is NSNumber:
    let lhs = a as! NSNumber
    let rhs = b as! NSNumber
        return lhs.isLessThan(rhs)
    case is NSString:
    let lhs = a as! NSString
    let rhs = b as! NSString
        return lhs.isLessThan(rhs)
    default:
        return true
    }
}

public class Set<T: Comparable>: NSObject {
    private var q: _Set<AnyObject>
    init(_ cmp: @escaping @convention(c) (Any, Any) -> Bool = compareFunction) {
                self.q = _Set<AnyObject>(cmp);

    }
    
    func insert(_ value: T) {
        switch value {
        case is Bool:
            let number: NSNumber = NSNumber(value: value as! Bool)
            q.insert(number)
            
        case is CChar:
            let number: NSNumber = NSNumber(value: value as! CChar)
            q.insert(number)

        case is Float:
            let number: NSNumber = NSNumber(value: value as! Float)
            q.insert(number)

        case is Double:
            let number: NSNumber = NSNumber(value: value as! Double)
            q.insert(number)

        case is Int:
            let number: NSNumber = NSNumber(value: value as! Int)
            q.insert(number)

        case is Int8:
            let number: NSNumber = NSNumber(value: value as! Int8)
            q.insert(number)

        case is Int16:
            let number: NSNumber = NSNumber(value: value as! Int16)
            q.insert(number)

        case is Int32:
            let number: NSNumber = NSNumber(value: value as! Int32)
            q.insert(number)

        case is Int64:
            let number: NSNumber = NSNumber(value: value as! Int64)
            q.insert(number)

        case is UInt:
            let number: NSNumber = NSNumber(value: value as! UInt)
            q.insert(number)

        case is UInt8:
            let number: NSNumber = NSNumber(value: value as! UInt8)
            q.insert(number)

        case is UInt16:
            let number: NSNumber = NSNumber(value: value as! UInt16)
            q.insert(number)
        case is UInt32:
            let number: NSNumber = NSNumber(value: value as! UInt32)
            q.insert(number)
        case is UInt64:
            let number: NSNumber = NSNumber(value: value as! UInt64)
            q.insert(number)
        default:
            q.insert(value)
        }
    }
    
    var count: Int {Int(q.count())}
    
    var empty: Bool {q.empty()}
    var isEmpty: Bool {q.empty()}
    
    func nth(_ index: Int) -> T {
        let v: T = q.nth(Int32(index)) as! T
        return v
    }
    
    func begin() -> Int {
        return Int(q.begin())
    }
    
    func end() -> Int {
        return Int(q.end())
    }
}

extension Set: Sequence {
    public func makeIterator() -> some IteratorProtocol {
        return SetIterator<T>(self)
    }
}

struct SetIterator<T: Comparable>: IteratorProtocol {
    private let set: Set<T>
    private var index = 0
    
    typealias Element = T
    init(_ set: Set<T>) {
        self.set = set
    }
    
    mutating func next() -> Element? {
        if index != set.end() {
            let value: Element = set.nth(index)
            index += 1;
            return value
        } else {
            return nil
        }
    }
}
