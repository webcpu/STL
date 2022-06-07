import CxxSTL

public func compareFunction(_ a: Any, _ b: Any) -> Bool {
    let lhs: Int = a as! Int
    let rhs: Int = b as! Int
    return lhs < rhs
}

//class FunctionObject {
//    var compare: (Any, Any) -> Bool = { (a, b) in
//        let lhs: Int = a as! Int
//        let rhs: Int = b as! Int
//        return lhs < rhs
//    }
//}

public class PriorityQueue<T: Comparable>: NSObject {
    private var q: _PriorityQueue<AnyObject>
//    var compare: (Any, Any) -> Bool = { (a, b) in
//        let lhs: T = a as! T
//        let rhs: T = b as! T
//        return lhs < rhs
//    }
    var compare: (Any, Any) -> Bool = { (a, b) in
        let lhs: Int = a as! Int
        let rhs: Int = b as! Int
        return lhs < rhs
    }
    
    var fo: _Function<AnyObject>
    
    public func compareF(_ a: Any, _ b: Any) -> Bool {
        let lhs: Int = a as! Int
        let rhs: Int = b as! Int
     //   return lhs < rhs
        return compare(a, b)
    }
    
    init(_ cmp: @escaping @convention(c) (Any, Any) -> Bool = compareFunction) {
//        self.compare = cmp
        let f = {(a: Any, b: Any) -> Bool in
            let lhs: Int = a as! Int
            let rhs: Int = b as! Int
            return lhs < rhs
        }
        self.fo = _Function<AnyObject>(cmp)
        //        if T.self is Int {
        //            self.q = _PriorityQueue<NSNumber>() as! _PriorityQueue<AnyObject>
        //        } else {
        //            self.q = _PriorityQueue<AnyObject>()
        //        }
//      let object = NSObject()
 //       self.q = _PriorityQueue<AnyObject>(compareFunction);
//        super.init()
     //   let context = Unmanaged.passRetained(self.fo).toOpaque()
        self.q = _PriorityQueue<AnyObject>(self.fo);

//        self.q = _PriorityQueue<AnyObject>({(a: Any, b: Any) -> Bool in
//            let fo = Unmanaged<FunctionObject>.fromOpaque(context).takeRetainedValue()
//            return fo.compare(a, b)});
//        self.q.compareCompletion = cmp //compareFunction;
//        {(a, b) -> Bool in
//                    return self.compareF(a, b)}
        
//                self.q = _PriorityQueue<AnyObject>(self.compareF)
//        self.q = _PriorityQueue<AnyObject>({ (a, b) -> Bool in
            //            let lhs: Int = a as! Int
            //           let rhs: Int = b as! Int
            //          return lhs < rhs
//            return cmp(a, b)
//        })
        //
        //        self.q = _PriorityQueue<AnyObject>(compare as  (Optional<@convention(c) (Optional<Any>, Optional<Any>) -> Bool>))
    }
    
    
    func compare(_ lhs: T, _ rhs: T) -> Bool {
        return true
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
