import CxxSTL

class Stack<T>: NSObject {
    private var q: _Stack<AnyObject>
    
    override init() {
        self.q = _Stack<AnyObject>()
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
