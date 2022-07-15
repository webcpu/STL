import CxxSTL

public func _orderedSetCompareFunction(_ a: Any, _ b: Any) -> Bool {
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
 OrderedSets are containers that store unique elements following a specific order.

 In an OrderedSet, the value of an element also identifies it (the value is itself the key, of type T), and each value must be unique. The value of the elements in a set cannot be modified once in the container (the elements are always const), but they can be inserted or removed from the container.

 Internally, the elements in a set are always sorted following a specific strict weak ordering criterion indicated by its internal comparison object (of type Compare).

 OrderedSet containers are generally slower than unordered set containers to access individual elements by their key, but they allow the direct iteration on subsets based on their order.

 OrderedSets are typically implemented as binary search trees.
 */
public class OrderedSet<T: Comparable>: NSObject {
    private var q: _Set<AnyObject>
    private var _index = 0
    private var cmp: @convention(c) (Any, Any) -> Bool
    
    /// Creates a new, empty OrderedSet.
    /// ```swift
    /// let set = OrderedSet<Int>()
    /// ```
    public init(_ cmp: @escaping @convention(c) (Any, Any) -> Bool = _orderedSetCompareFunction) {
        self.cmp = _orderedSetCompareFunction;
        self.q = _Set<AnyObject>(cmp);
        _index = 0;
    }
    
    /**
     Extends the container by inserting new elements, effectively increasing the container size by the number of elements inserted.

     Because elements in a set are unique, the insertion operation checks whether each inserted element is equivalent to an element already in the container, and if so, the element is not inserted, returning an iterator to this existing element (if the function returns a value).
     */
    public func insert(_ value: T) {
        switch value {
        case is Bool:
            let number: NSNumber = NSNumber(value: value as! Bool)
            q.insert(number)
            
        case is CChar:
            let number: NSNumber = NSNumber(value: value as! CChar)
            q.insert(number)
            
        case is Float:
            let number: NSNumber = NSNumber(value: value as! Float)
            q.insert(number)
            
        case is Double:
            let number: NSNumber = NSNumber(value: value as! Double)
            q.insert(number)
            
        case is Int:
            let number: NSNumber = NSNumber(value: value as! Int)
            q.insert(number)
            
        case is Int8:
            let number: NSNumber = NSNumber(value: value as! Int8)
            q.insert(number)
            
        case is Int16:
            let number: NSNumber = NSNumber(value: value as! Int16)
            q.insert(number)
            
        case is Int32:
            let number: NSNumber = NSNumber(value: value as! Int32)
            q.insert(number)
            
        case is Int64:
            let number: NSNumber = NSNumber(value: value as! Int64)
            q.insert(number)
            
        case is UInt:
            let number: NSNumber = NSNumber(value: value as! UInt)
            q.insert(number)
            
        case is UInt8:
            let number: NSNumber = NSNumber(value: value as! UInt8)
            q.insert(number)
            
        case is UInt16:
            let number: NSNumber = NSNumber(value: value as! UInt16)
            q.insert(number)
        case is UInt32:
            let number: NSNumber = NSNumber(value: value as! UInt32)
            q.insert(number)
        case is UInt64:
            let number: NSNumber = NSNumber(value: value as! UInt64)
            q.insert(number)
        default:
            q.insert(value)
        }
    }
    
    /// The number of elements in the ordered set.
    public var count: Int {Int(q.count())}
    
    /// A Boolean value indicating whether the ordered set is empty.
    public var isEmpty: Bool {q.empty()}
    
    var empty: Bool {q.empty()}
    
    /**
     Returns a new set with the elements that are common to both this set and the given sequence.  */
    public func intersection(_ other: OrderedSet<T>) -> OrderedSet<T> {
        let result = OrderedSet<T>(self.cmp)
        for x in self {
            if other.contains(x) {
                result.insert(x)
            }
        }
        return result
    }
    
    /**
     Returns a new set with the elements of both this set and the given sequence.
     */
    public func union(_ other: OrderedSet<T>) -> OrderedSet<T> {
        let result = OrderedSet<T>(self.cmp)
        for x in self {
            result.insert(x)
        }
        
        for x in other {
            result.insert(x)
        }
        return result
    }
    
   /**
    Returns a new set containing the elements of this set that do not occur in the given set.
   */
    public func subtraction(_ other: OrderedSet<T>) -> OrderedSet<T> {
        return self.complement(other)
    }
    
    func difference(_ other: OrderedSet<T>) -> OrderedSet<T> {
        return self.complement(other)
    }
    
    func complement(_ other: OrderedSet<T>) -> OrderedSet<T> {
        let result = OrderedSet<T>(self.cmp)
        for x in self {
            if !other.contains(x) {
                result.insert(x)
            }
        }
        return result
    }
    
    /// Returns a Boolean value that indicates whether the given element exists in the set.
    public func contains(_ elem: T) -> Bool {
        return q.contains(elem)
    }
    
    /// Removes from the set container a single element
    public func erase(_ key: T) {
        q.erase(key)
    }
    
    func nth(_ index: Int) -> T {
        let v: T = q.nth(Int32(index)) as! T
        return v
    }
    
    func begin() -> Int {
        return Int(q.begin())
    }
    
    func end() -> Int {
        return Int(q.end())
    }
}

extension OrderedSet: Sequence, IteratorProtocol {
    public typealias Element = T
    
    public func next() -> T? {
        if _index != end() {
            let value: T = nth(_index)
            _index += 1;
            return value
        } else {
            return nil
        }
    }
}
