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

public class PriorityQueue<T: Comparable>: NSObject {
    private var q: _PriorityQueue<AnyObject>
    init(_ cmp: @escaping @convention(c) (Any, Any) -> Bool = compareFunction) {
        self.q = _PriorityQueue<AnyObject>(_Function<AnyObject>(cmp));
    }
    
    func push(_ value: T) {
        switch value {
        case is Bool:
            let number: NSNumber = NSNumber(value: value as! Bool)
            q.push(number)
            
        case is CChar:
            let number: NSNumber = NSNumber(value: value as! CChar)
            q.push(number)
            
        case is Float:
            let number: NSNumber = NSNumber(value: value as! Float)
            q.push(number)
            
        case is Double:
            let number: NSNumber = NSNumber(value: value as! Double)
            q.push(number)
            
        case is Int:
            let number: NSNumber = NSNumber(value: value as! Int)
            q.push(number)
        case is Int8:
            let number: NSNumber = NSNumber(value: value as! Int8)
            q.push(number)
        case is Int16:
            let number: NSNumber = NSNumber(value: value as! Int16)
            q.push(number)
        case is Int32:
            let number: NSNumber = NSNumber(value: value as! Int32)
            q.push(number)
        case is Int64:
            let number: NSNumber = NSNumber(value: value as! Int64)
            q.push(number)
            
        case is UInt:
            let number: NSNumber = NSNumber(value: value as! UInt)
            q.push(number)
        case is UInt8:
            let number: NSNumber = NSNumber(value: value as! UInt8)
            q.push(number)
        case is UInt16:
            let number: NSNumber = NSNumber(value: value as! UInt16)
            q.push(number)
        case is UInt32:
            let number: NSNumber = NSNumber(value: value as! UInt32)
            q.push(number)
        case is UInt64:
            let number: NSNumber = NSNumber(value: value as! UInt64)
            q.push(number)
        default:
            q.push(value as AnyObject)
        }
    }
    
    func top() -> T {
        precondition(!q.empty())
        return q.top() as! T
    }
    
    func pop() {
        q.pop()
    }
    
    var count: Int {Int(q.count())}
    
    var empty: Bool {q.empty()}
    var isEmpty: Bool {q.empty()}
}
