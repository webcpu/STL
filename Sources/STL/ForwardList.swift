import CxxSTL

class ForwardList<T>: NSObject {
    private var q: _ForwardList<AnyObject>
    
    override init() {
        self.q = _ForwardList<AnyObject>()
    }
    
    func push_front(_ value: T) {
        switch value {
        case is Bool:
            let number: NSNumber = NSNumber(value: value as! Bool)
            q.push_front(number)
            
        case is CChar:
            let number: NSNumber = NSNumber(value: value as! CChar)
            q.push_front(number)
            
        case is Float:
            let number: NSNumber = NSNumber(value: value as! Float)
            q.push_front(number)
            
        case is Double:
            let number: NSNumber = NSNumber(value: value as! Double)
            q.push_front(number)
            
        case is Int:
            let number: NSNumber = NSNumber(value: value as! Int)
            q.push_front(number)
        case is Int8:
            let number: NSNumber = NSNumber(value: value as! Int8)
            q.push_front(number)
        case is Int16:
            let number: NSNumber = NSNumber(value: value as! Int16)
            q.push_front(number)
        case is Int32:
            let number: NSNumber = NSNumber(value: value as! Int32)
            q.push_front(number)
        case is Int64:
            let number: NSNumber = NSNumber(value: value as! Int64)
            q.push_front(number)
            
        case is UInt:
            let number: NSNumber = NSNumber(value: value as! UInt)
            q.push_front(number)
        case is UInt8:
            let number: NSNumber = NSNumber(value: value as! UInt8)
            q.push_front(number)
        case is UInt16:
            let number: NSNumber = NSNumber(value: value as! UInt16)
            q.push_front(number)
        case is UInt32:
            let number: NSNumber = NSNumber(value: value as! UInt32)
            q.push_front(number)
        case is UInt64:
            let number: NSNumber = NSNumber(value: value as! UInt64)
            q.push_front(number)
        default:
            q.push_front(value as AnyObject)
        }
    }
    
    func front() -> T {
        precondition(!q.empty())
        return q.front() as! T
    }
    
    func pop_front() {
        q.pop_front()
    }
    
    var empty: Bool {q.empty()}
    var isEmpty: Bool {q.empty()}
}
