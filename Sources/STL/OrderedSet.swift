import CxxSTL

fileprivate func compareFunction(_ a: Any, _ b: Any) -> Bool {
    precondition(type(of: a) == (type(of: b)))
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

public class OrderedSet<T: Comparable>: NSObject {
    private var q: _Set<AnyObject>
    private var _index = 0
    private var cmp: @convention(c) (Any, Any) -> Bool
    
    init(_ cmp: @escaping @convention(c) (Any, Any) -> Bool = compareFunction) {
        self.cmp = compareFunction;
        self.q = _Set<AnyObject>(cmp);
        _index = 0;
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
    
    
    func intersection(_ s2: OrderedSet<T>) -> OrderedSet<T> {
        let result = OrderedSet<T>(self.cmp)
        for x in self {
            if s2.contains(x) {
                result.insert(x)
            }
        }
        return result
    }
    
    func union(_ s2: OrderedSet<T>) -> OrderedSet<T> {
        let result = OrderedSet<T>(self.cmp)
        for x in self {
            result.insert(x)
        }
        
        for x in s2 {
            result.insert(x)
        }
        return result
    }
    
    func subtraction(_ s2: OrderedSet<T>) -> OrderedSet<T> {
        return self.complement(s2)
    }
    
    func difference(_ s2: OrderedSet<T>) -> OrderedSet<T> {
        return self.complement(s2)
    }
    
    func complement(_ s2: OrderedSet<T>) -> OrderedSet<T> {
        let result = OrderedSet<T>(self.cmp)
        for x in self {
            if !s2.contains(x) {
                result.insert(x)
            }
        }
        return result
    }
    
    func contains(_ elem: T) -> Bool {
        return q.contains(elem)
    }
    
    func erase(_ key: T) {
        q.erase(key)
    }
    
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

extension OrderedSet: Sequence, IteratorProtocol {
    public typealias Element = T
    
    public func next() -> T? {
        if _index != end() {
            let value: T = nth(_index)
            _index += 1;
            return value
        } else {
            return nil
        }
    }
}
