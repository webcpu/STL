import CxxSTL

class Stack<T>: NSObject {
    private var stack: _Stack<AnyObject>
    
    override init() {
        self.stack = _Stack<AnyObject>()
    }
    
    func push(_ value: T) {
        switch value {
        case is Bool:
            let number: NSNumber = NSNumber(value: value as! Bool)
            stack.push(number)
            
        case is CChar:
            let number: NSNumber = NSNumber(value: value as! CChar)
            stack.push(number)
            
        case is Float:
            let number: NSNumber = NSNumber(value: value as! Float)
            stack.push(number)
            
        case is Double:
            let number: NSNumber = NSNumber(value: value as! Double)
            stack.push(number)
            
        case is Int:
            let number: NSNumber = NSNumber(value: value as! Int)
            stack.push(number)
        case is Int8:
            let number: NSNumber = NSNumber(value: value as! Int8)
            stack.push(number)
        case is Int16:
            let number: NSNumber = NSNumber(value: value as! Int16)
            stack.push(number)
        case is Int32:
            let number: NSNumber = NSNumber(value: value as! Int32)
            stack.push(number)
        case is Int64:
            let number: NSNumber = NSNumber(value: value as! Int64)
            stack.push(number)
            
        case is UInt:
            let number: NSNumber = NSNumber(value: value as! UInt)
            stack.push(number)
        case is UInt8:
            let number: NSNumber = NSNumber(value: value as! UInt8)
            stack.push(number)
        case is UInt16:
            let number: NSNumber = NSNumber(value: value as! UInt16)
            stack.push(number)
        case is UInt32:
            let number: NSNumber = NSNumber(value: value as! UInt32)
            stack.push(number)
        case is UInt64:
            let number: NSNumber = NSNumber(value: value as! UInt64)
            stack.push(number)
        default:
            stack.push(value as AnyObject)
        }
    }
    
    func top() -> T {
        precondition(!stack.empty())
        return stack.top() as! T
    }
    
    func pop() {
        stack.pop()
    }
    
    var count: Int {Int(stack.count())}
    
    var empty: Bool {stack.empty()}
    var isEmpty: Bool {stack.empty()}
}
