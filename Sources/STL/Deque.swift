import CxxSTL

class Deque<T>: NSObject {
    private var q: _Deque<AnyObject>
    
    override init() {
        self.q = _Deque<AnyObject>()
    }
    
    func push_back(_ value: T) {
        switch value {
        case is Bool:
            let number: NSNumber = NSNumber(value: value as! Bool)
            q.push_back(number)
            
        case is CChar:
            let number: NSNumber = NSNumber(value: value as! CChar)
            q.push_back(number)
            
        case is Float:
            let number: NSNumber = NSNumber(value: value as! Float)
            q.push_back(number)
            
        case is Double:
            let number: NSNumber = NSNumber(value: value as! Double)
            q.push_back(number)
            
        case is Int:
            let number: NSNumber = NSNumber(value: value as! Int)
            q.push_back(number)
        case is Int8:
            let number: NSNumber = NSNumber(value: value as! Int8)
            q.push_back(number)
        case is Int16:
            let number: NSNumber = NSNumber(value: value as! Int16)
            q.push_back(number)
        case is Int32:
            let number: NSNumber = NSNumber(value: value as! Int32)
            q.push_back(number)
        case is Int64:
            let number: NSNumber = NSNumber(value: value as! Int64)
            q.push_back(number)
            
        case is UInt:
            let number: NSNumber = NSNumber(value: value as! UInt)
            q.push_back(number)
        case is UInt8:
            let number: NSNumber = NSNumber(value: value as! UInt8)
            q.push_back(number)
        case is UInt16:
            let number: NSNumber = NSNumber(value: value as! UInt16)
            q.push_back(number)
        case is UInt32:
            let number: NSNumber = NSNumber(value: value as! UInt32)
            q.push_back(number)
        case is UInt64:
            let number: NSNumber = NSNumber(value: value as! UInt64)
            q.push_back(number)
        default:
            q.push_back(value as AnyObject)
        }
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
    
    func insert(_ value: T, at: Int) {
        let index = Int32(at)

        switch value {
        case is Bool:
            let number: NSNumber = NSNumber(value: value as! Bool)
            q.insert(number, at: index)

        case is CChar:
            let number: NSNumber = NSNumber(value: value as! CChar)
            q.insert(number, at: index)

        case is Float:
            let number: NSNumber = NSNumber(value: value as! Float)
            q.insert(number, at: index)

        case is Double:
            let number: NSNumber = NSNumber(value: value as! Double)
            q.insert(number, at: index)

        case is Int:
            let number: NSNumber = NSNumber(value: value as! Int)
            q.insert(number, at: index)
        case is Int8:
            let number: NSNumber = NSNumber(value: value as! Int8)
            q.insert(number, at: index)
        case is Int16:
            let number: NSNumber = NSNumber(value: value as! Int16)
            q.insert(number, at: index)
        case is Int32:
            let number: NSNumber = NSNumber(value: value as! Int32)
            q.insert(number, at: index)
        case is Int64:
            let number: NSNumber = NSNumber(value: value as! Int64)
            q.insert(number, at: index)

        case is UInt:
            let number: NSNumber = NSNumber(value: value as! UInt)
            q.insert(number, at: index)
        case is UInt8:
            let number: NSNumber = NSNumber(value: value as! UInt8)
            q.insert(number, at: index)
        case is UInt16:
            let number: NSNumber = NSNumber(value: value as! UInt16)
            q.insert(number, at: index)
        case is UInt32:
            let number: NSNumber = NSNumber(value: value as! UInt32)
            q.insert(number, at: index)
        case is UInt64:
            let number: NSNumber = NSNumber(value: value as! UInt64)
            q.insert(number, at: index)
        default:
            q.insert(value as AnyObject, at: index)
        }
    }
    
    func front() -> T {
        precondition(!q.empty())
        return q.front() as! T
    }
    
    func back() -> T {
        precondition(!q.empty())
        return q.back() as! T
    }
    
    func pop_back() {
        q.pop_back()
    }
    
    func pop_front() {
        q.pop_front()
    }
    
    var count: Int {Int(q.count())}
    
    var empty: Bool {q.empty()}
    var isEmpty: Bool {q.empty()}
}
