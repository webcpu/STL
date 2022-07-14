import CxxSTL

class List<T>: NSObject {
    private var list: _List<AnyObject>
    
    override init() {
        self.list = _List<AnyObject>()
    }
    
    func push_back(_ value: T) {
        switch value {
        case is Bool:
            let number: NSNumber = NSNumber(value: value as! Bool)
            list.push_back(number)
            
        case is CChar:
            let number: NSNumber = NSNumber(value: value as! CChar)
            list.push_back(number)
            
        case is Float:
            let number: NSNumber = NSNumber(value: value as! Float)
            list.push_back(number)
            
        case is Double:
            let number: NSNumber = NSNumber(value: value as! Double)
            list.push_back(number)
            
        case is Int:
            let number: NSNumber = NSNumber(value: value as! Int)
            list.push_back(number)
        case is Int8:
            let number: NSNumber = NSNumber(value: value as! Int8)
            list.push_back(number)
        case is Int16:
            let number: NSNumber = NSNumber(value: value as! Int16)
            list.push_back(number)
        case is Int32:
            let number: NSNumber = NSNumber(value: value as! Int32)
            list.push_back(number)
        case is Int64:
            let number: NSNumber = NSNumber(value: value as! Int64)
            list.push_back(number)
            
        case is UInt:
            let number: NSNumber = NSNumber(value: value as! UInt)
            list.push_back(number)
        case is UInt8:
            let number: NSNumber = NSNumber(value: value as! UInt8)
            list.push_back(number)
        case is UInt16:
            let number: NSNumber = NSNumber(value: value as! UInt16)
            list.push_back(number)
        case is UInt32:
            let number: NSNumber = NSNumber(value: value as! UInt32)
            list.push_back(number)
        case is UInt64:
            let number: NSNumber = NSNumber(value: value as! UInt64)
            list.push_back(number)
        default:
            list.push_back(value as AnyObject)
        }
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
    
    func back() -> T {
        precondition(!list.empty())
        return list.back() as! T
    }
    
    func pop_back() {
        list.pop_back()
    }
    
    func pop_front() {
        list.pop_front()
    }
    
    func contains(_ elem: T) -> Bool {
        return list.contains(elem)
    }
    
    var count: Int {Int(list.count())}
    
    var empty: Bool {list.empty()}
    var isEmpty: Bool {list.empty()}
}
