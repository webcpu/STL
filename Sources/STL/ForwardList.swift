import CxxSTL

class ForwardList<T>: NSObject {
    private var list: _ForwardList<AnyObject>
    
    override init() {
        self.list = _ForwardList<AnyObject>()
    }
    
    func push_front(_ value: T) {
        switch value {
        case is Bool:
            let number: NSNumber = NSNumber(value: value as! Bool)
            list.push_front(number)
            
        case is CChar:
            let number: NSNumber = NSNumber(value: value as! CChar)
            list.push_front(number)
            
        case is Float:
            let number: NSNumber = NSNumber(value: value as! Float)
            list.push_front(number)
            
        case is Double:
            let number: NSNumber = NSNumber(value: value as! Double)
            list.push_front(number)
            
        case is Int:
            let number: NSNumber = NSNumber(value: value as! Int)
            list.push_front(number)
        case is Int8:
            let number: NSNumber = NSNumber(value: value as! Int8)
            list.push_front(number)
        case is Int16:
            let number: NSNumber = NSNumber(value: value as! Int16)
            list.push_front(number)
        case is Int32:
            let number: NSNumber = NSNumber(value: value as! Int32)
            list.push_front(number)
        case is Int64:
            let number: NSNumber = NSNumber(value: value as! Int64)
            list.push_front(number)
            
        case is UInt:
            let number: NSNumber = NSNumber(value: value as! UInt)
            list.push_front(number)
        case is UInt8:
            let number: NSNumber = NSNumber(value: value as! UInt8)
            list.push_front(number)
        case is UInt16:
            let number: NSNumber = NSNumber(value: value as! UInt16)
            list.push_front(number)
        case is UInt32:
            let number: NSNumber = NSNumber(value: value as! UInt32)
            list.push_front(number)
        case is UInt64:
            let number: NSNumber = NSNumber(value: value as! UInt64)
            list.push_front(number)
        default:
            list.push_front(value as AnyObject)
        }
    }
    
    func front() -> T {
        precondition(!list.empty())
        return list.front() as! T
    }
    
    func pop_front() {
        list.pop_front()
    }
    
    func contains(_ elem: T) -> Bool {
        return list.contains(elem)
    }
    
    var empty: Bool {list.empty()}
    var isEmpty: Bool {list.empty()}
}
