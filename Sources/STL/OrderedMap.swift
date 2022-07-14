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

public class OrderedMap<K: Comparable, V: Any>: NSObject {
    private var q: _Map<AnyObject, AnyObject>
    private var _index = 0

    init(_ cmp: @escaping @convention(c) (Any, Any) -> Bool = compareFunction) {
        self.q = _Map<AnyObject, AnyObject>(cmp);
        
    }
    
    func insert(_ pair: (K, V)) {
        let (key, value): (K, V) = pair
        switch key {
        case is Bool:
            let number: NSNumber = NSNumber(value: value as! Bool)
            q.insert([key, number])
            
        case is CChar:
            let number: NSNumber = NSNumber(value: value as! CChar)
            q.insert([key, number])
            
        case is Float:
            let number: NSNumber = NSNumber(value: value as! Float)
            q.insert([key, number])
            
        case is Double:
            let number: NSNumber = NSNumber(value: value as! Double)
            q.insert([key, number])
            
        case is Int:
            let number: NSNumber = NSNumber(value: value as! Int)
            q.insert([key, number])
            
        case is Int8:
            let number: NSNumber = NSNumber(value: value as! Int8)
            q.insert([key, number])
            
        case is Int16:
            let number: NSNumber = NSNumber(value: value as! Int16)
            q.insert([key, number])
            
        case is Int32:
            let number: NSNumber = NSNumber(value: value as! Int32)
            q.insert([key, number])
            
        case is Int64:
            let number: NSNumber = NSNumber(value: value as! Int64)
            q.insert([key, number])
            
        case is UInt:
            let number: NSNumber = NSNumber(value: value as! UInt)
            q.insert([key, number])
            
        case is UInt8:
            let number: NSNumber = NSNumber(value: value as! UInt8)
            q.insert([key, number])
            
        case is UInt16:
            let number: NSNumber = NSNumber(value: value as! UInt16)
            q.insert([key, number])
        case is UInt32:
            let number: NSNumber = NSNumber(value: value as! UInt32)
            q.insert([key, number])
        case is UInt64:
            let number: NSNumber = NSNumber(value: value as! UInt64)
            q.insert([key, number])
        default:
            q.insert([key, value as AnyObject])
        }
    }
    
    var count: Int {Int(q.count())}
    
    var empty: Bool {q.empty()}
    var isEmpty: Bool {q.empty()}
    
    var keys: [K] {
        return q.keys() as! [K]
    }
    
    var values: [V] {
        var vs = [V]();
        for key in self.keys {
            vs.append(self[key]);
        }
        return vs;
    }
    
    subscript(index: K) -> V! {
        get {
            if q.contains(index) {
                return q.at(index) as? V
            } else {
                return nil
            }
        }
        set(newValue) {
            if let value = newValue {
                q.insert([index, value])
            } else {
                q.erase(index)
            }
        }
    }
    
    func erase(_ key: K) {
        q.erase(key)
    }
    
    func nth(_ index: Int) -> (K, V) {
        let pair: [Any] = q.nth(index);
        let key: K = pair[0] as! K
        let value: V = pair[1] as! V
        return (key, value)
    }
    
    func begin() -> Int {
        return Int(q.begin())
    }
    
    func end() -> Int {
        return Int(q.end())
    }
}

extension OrderedMap: Sequence, IteratorProtocol {
    public typealias Element = (K, V)
    
    public func next() -> (K, V)? {
        if _index != end() {
            let value: (K, V) = nth(_index)
            _index += 1;
            return value
        } else {
            return nil
        }
    }
}