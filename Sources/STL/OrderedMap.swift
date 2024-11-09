import CxxSTL

public func _orderedMapCompareFunction(_ a: Any, _ b: Any) -> Bool {
    precondition(type(of: a) == (type(of: b)))
    switch a {
    case is NSNumber:
        let lhs = a as! NSNumber
        let rhs = b as! NSNumber
        return lhs.compare(rhs) !=  ComparisonResult.orderedDescending
    case is NSString:
        let lhs = a as! NSString
        let rhs = b as! NSString

        return lhs.compare(rhs as String) !=  ComparisonResult.orderedDescending
    default:
        return true
    }
}

/**
 OrderedMaps are associative containers that store elements formed by a combination of a key value and a mapped value, following a specific order.

 In a map, the key values are generally used to sort and uniquely identify the elements, while the mapped values store the content associated to this key.

 Internally, the elements in a map are always sorted by its key following a specific strict weak ordering criterion indicated by its internal comparison object (of type Compare).

 map containers are generally slower than unordered_map containers to access individual elements by their key, but they allow the direct iteration on subsets based on their order.

 The mapped values in a map can be accessed directly by their corresponding key using the bracket operator ((operator[]).

 OrderedMaps are typically implemented as binary search trees.
 */
public class OrderedMap<K: Comparable, V: Any>: NSObject {
    private var q: _Map<AnyObject, AnyObject>
    private var _index = 0

    /// Creates a new, empty OrderedMultiMap.
    /// ```swift
    /// let m = OrderedMap<Int>()
    /// ```
    public init(_ cmp: @escaping @convention(c) (Any, Any) -> Bool = _orderedMapCompareFunction) {
        self.q = _Map<AnyObject, AnyObject>(cmp);
    }
    
    /**
     Inserts a key value pair into the container.
     */
    public func insert(_ pair: (K, V)) {
        let (key, value): (K, V) = pair
        switch value {
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
    
    /// The number of elements in the ordered map.
    public var count: Int {Int(q.count())}
    
    /// A Boolean value indicating whether the ordered map is empty.
    public var isEmpty: Bool {q.empty()}
    
    var empty: Bool {q.empty()}
    
    /// A collection containing just the keys of the map.
    public var keys: [K] {
        return q.keys() as! [K]
    }
    
    /// A collection containing just the values of the map.
    public var values: [V] {
        return q.values() as! [V]
//        var vs = [V]();
//        for key in self.keys {
//            vs.append(self[key]);
//        }
//        return vs;
    }
    
    /// Accesses the key-value pair at the specified position.
    public subscript(index: K) -> V! {
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
    
    /// Removes from the multimap container a pair
    public func erase(_ key: K) {
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
