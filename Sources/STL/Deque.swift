import CxxSTL

/**
 Deque (usually pronounced like "deck") is an irregular acronym of double-ended queue. Double-ended queues are sequence containers with dynamic sizes that can be expanded or contracted on both ends (either its front or its back).

 Specific libraries may implement deques in different ways, generally as some form of dynamic array. But in any case, they allow for the individual elements to be accessed directly through random access iterators, with storage handled automatically by expanding and contracting the container as needed.

 Therefore, they provide a functionality similar to vectors, but with efficient insertion and deletion of elements also at the beginning of the sequence, and not only at its end. But, unlike vectors, deques are not guaranteed to store all its elements in contiguous storage locations: accessing elements in a deque by offsetting a pointer to another element causes undefined behavior.

 Both vectors and deques provide a very similar interface and can be used for similar purposes, but internally both work in quite different ways: While vectors use a single array that needs to be occasionally reallocated for growth, the elements of a deque can be scattered in different chunks of storage, with the container keeping the necessary information internally to provide direct access to any of its elements in constant time and with a uniform sequential interface (through iterators). Therefore, deques are a little more complex internally than vectors, but this allows them to grow more efficiently under certain circumstances, especially with very long sequences, where reallocations become more expensive.

 For operations that involve frequent insertion or removals of elements at positions other than the beginning or the end, deques perform worse and have less consistent iterators and references than lists and forward lists.
 */
public class Deque<T>: NSObject {
    private var q: _Deque<AnyObject>
    private var _index = 0
    
    /// Creates a new, empty deque.
    /// ```swift
    /// let l = Deque<Int>()
    /// ```
    public override init() {
        self.q = _Deque<AnyObject>()
    }
    
    /** Appends the given element value to the end of the container.*/
    public func pushBack(_ value: T) {
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
    
    /// Prepends the given element value to the beginning of the container.
    public func pushFront(_ value: T) {
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
    
    /// Inserts elements at the specified location in the container.
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
    
    /// Returns the first element in the container.
    public var front: T {
        precondition(!q.empty())
        return q.front() as! T
    }
   
    /// Returns the last element in the container.
    public var back: T {
        precondition(!q.empty())
        return q.back() as! T
    }
    
    func at(_ index: Int) -> T {
        precondition(!q.empty())
        return q.at(Int32(index)) as! T
    }
    
    /// Erases the specified elements from the container.
    public func erase(_ index: Int) {
        precondition(index < count)
        q.erase(Int32(index))
    }
    
    /**
     Removes the last element of the container.
     If there are no elements in the container, the behavior is undefined.
     */
    public func popBack() {
        q.pop_back()
    }
    
    /**
     Removes the first element of the container. If there are no elements in the container, the behavior is undefined.
     */
    public func popFront() {
        q.pop_front()
    }
    
    /// Returns a Boolean value that indicates whether the given element exists in the deque.
    public func contains(_ value: T) -> Bool {
        return q.contains(value)
    }
    
    /// Accesses the value at the specified position.
    public subscript(index: Int) -> T {
        get {
            return q.at(Int32(index)) as! T
        }
        set(newValue) {
            precondition(index < count)
            q.update(newValue, at: Int32(index))
        }
    }
    
    /// The number of elements in the deque.
    public var count: Int {Int(q.count())}
    
    /// A Boolean value indicating whether the deque is empty.
    public var isEmpty: Bool {q.empty()}
    
    var empty: Bool {q.empty()}
}

extension Deque: Sequence, IteratorProtocol {
    public typealias Element = T
    
    public func next() -> T? {
        if _index < count {
            let value: T = self[_index]
            _index += 1;
            return value
        } else {
            return nil
        }
    }
}
