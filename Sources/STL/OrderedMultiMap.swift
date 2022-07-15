import CxxSTL

public func _orderedMultiMapCompareFunction(_ a: Any, _ b: Any) -> Bool {
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

/**
 OrderedMultiMaps are associative containers that store elements formed by a combination of a key value and a mapped value, following a specific order, and where multiple elements can have equivalent keys.

 In a multimap, the key values are generally used to sort and uniquely identify the elements, while the mapped values store the content associated to this key. The types of key and mapped value may differ, and are grouped together in member type value_type.

 Internally, the elements in a multimap are always sorted by its key following a specific strict weak ordering criterion indicated by its internal comparison object (of type Compare).

 multimap containers are generally slower than unordered_multimap containers to access individual elements by their key, but they allow the direct iteration on subsets based on their order.

 Multimaps are typically implemented as binary search trees.
 */
public class OrderedMultiMap<K: Comparable, V: Any>: NSObject {
    private var q: _MultiMap<AnyObject, AnyObject>
    private var _index = 0

    /// Creates a new, empty OrderedMultiMap.
    /// ```swift
    /// let m = OrderedMultiMap<Int>()
    /// ```
    public init(_ cmp: @escaping @convention(c) (Any, Any) -> Bool = _orderedMultiMapCompareFunction) {
        self.q = _MultiMap<AnyObject, AnyObject>(cmp);
        
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
    
    /// Removes from the multimap container a pair
    public func erase(_ pair: (K, V)) {
        q.erase([pair.0, pair.1])
    }
    
    /// The number of elements in the ordered multimap.
    public var count: Int {Int(q.count())}
    
    /// A Boolean value indicating whether the ordered multimap is empty.
    public var isEmpty: Bool {q.empty()}
    
    var empty: Bool {q.empty()}
    
    /// A collection containing just the keys of the multimap.
    public var keys: [K] {
        return q.keys() as! [K]
    }
    
    /// A collection containing just the values of the multimap.
    public var values: [V] {
        return q.values() as! [V]
    }
    
    // all the elements in the container which have a key equivalent to key.
    func equal_range(_ key: K) -> [V] {
        return q.equal_range(key) as! [V]
    }
    
    /// Accesses the key-value pairs at the specified position.
    public subscript(index: K) -> [V]! {
        get {
            if q.contains(index) {
                return equal_range(index)
            } else {
                return nil
            }
        }
//        set {
//            q.insert([index, newValue])
//        }
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

extension OrderedMultiMap: Sequence, IteratorProtocol {
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

//extension MultiOrderedMap: Sequence {
//    public func makeIterator() -> some IteratorProtocol {
//        return MultiMapIterator<K, V>(self)
//    }
//}
//
//struct MultiMapIterator<K: Comparable, V>: IteratorProtocol {
//    private let map: MultiOrderedMap<K, V>
//    private var index = 0
//
//    typealias Element = (K, V)
//    init(_ map: MultiOrderedMap<K, V>) {
//        self.map = map
//    }
//
//    mutating func next() -> Element? {
//        if index != map.end() {
//            let pair: Element = map.nth(index)
//            index += 1;
//            return pair
//        } else {
//            return nil
//        }
//    }
//}

extension Sequence where Element: Equatable {
    func unique() -> [Element] {
        NSOrderedSet(array: self as! [Any]).array as! [Element]
    }
}
