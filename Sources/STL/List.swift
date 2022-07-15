import CxxSTL

/**
Lists are sequence containers that allow constant time insert and erase operations anywhere within the sequence, and iteration in both directions.

List containers are implemented as doubly-linked lists; Doubly linked lists can store each of the elements they contain in different and unrelated storage locations. The ordering is kept internally by the association to each element of a link to the element preceding it and a link to the element following it.

They are very similar to forward_list: The main difference being that forward_list objects are single-linked lists, and thus they can only be iterated forwards, in exchange for being somewhat smaller and more efficient.

Compared to other base standard sequence containers (array, vector and deque), lists perform generally better in inserting, extracting and moving elements in any position within the container for which an iterator has already been obtained, and therefore also in algorithms that make intensive use of these, like sorting algorithms.

The main drawback of lists and forward_lists compared to these other sequence containers is that they lack direct access to the elements by their position; For example, to access the sixth element in a list, one has to iterate from a known position (like the beginning or the end) to that position, which takes linear time in the distance between these. They also consume some extra memory to keep the linking information associated to each element (which may be an important factor for large lists of small-sized elements).
*/

public class List<T>: NSObject {
    private var list: _List<AnyObject>
    
    /// Creates a new, empty List.
    /// ```swift
    /// let l = List<Int>()
    /// ```
    public override init() {
        self.list = _List<AnyObject>()
    }
    
    /**
     Appends the given element value to the end of the container.
     */
    public func pushBack(_ value: T) {
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
    
    /**
     Prepends the given element value to the beginning of the container.
     */
    public func pushFront(_ value: T) {
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
    
    /**Returns the first element in the container.
    Calling front on an empty container is undefined.
     */
    public var front: T {
        precondition(!list.empty())
        return list.front() as! T
    }
    
    /// Returns the last element in the container. Calling back on an empty container causes undefined behavior.
    public var back: T {
        precondition(!list.empty())
        return list.back() as! T
    }
    
    /**
     Removes the last element of the container.
     Calling pop_back on an empty container results in undefined behavior.
     */
    public func popBack() {
        list.pop_back()
    }
    
    /** Removes the first element of the container. If there are no elements in the container, the behavior is undefined.
    */
    public func popFront() {
        list.pop_front()
    }
    
    /// Returns a Boolean value that indicates whether the given element exists in the list.
    public func contains(_ elem: T) -> Bool {
        return list.contains(elem)
    }
    
    /// The number of elements in the list.
    public var count: Int {Int(list.count())}
    
    /// A Boolean value indicating whether the list is empty.
    public var isEmpty: Bool {list.empty()}
    
    var empty: Bool {list.empty()}
}
