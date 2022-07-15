import CxxSTL

public func _priorityQueueCompareFunction(_ a: Any, _ b: Any) -> Bool {
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
 Priority queue
 Priority queues are a type of container adaptors, specifically designed such that its first element is always the greatest of the elements it contains, according to some strict weak ordering criterion.

 This context is similar to a heap, where elements can be inserted at any moment, and only the max heap element can be retrieved (the one at the top in the priority queue).

 Priority queues are implemented as container adaptors, which are classes that use an encapsulated object of a specific container class as its underlying container, providing a specific set of member functions to access its elements. Elements are popped from the "back" of the specific container, which is known as the top of the priority queue.

 The underlying container may be any of the standard container class templates or some other specifically designed container class. The container shall be accessible through random access iterators and support the following operations:
 empty()
 size()
 front()
 push_back()
 pop_back()

 The standard container classes vector and deque fulfill these requirements. By default, if no container class is specified for a particular priority_queue class instantiation, the standard container vector is used.

 Support of random access iterators is required to keep a heap structure internally at all times. This is done automatically by the container adaptor by automatically calling the algorithm functions make_heap, push_heap and pop_heap when needed.

 */
public class PriorityQueue<T: Comparable>: NSObject {
    private var q: _PriorityQueue<AnyObject>
    
    /// Creates a new, empty PriorityQueue.
    /// ```swift
    /// let queue = PriorityQueue<Int>()
    /// ```
    public init(_ cmp: @escaping @convention(c) (Any, Any) -> Bool = _priorityQueueCompareFunction) {
        self.q = _PriorityQueue<AnyObject>(_Function<AnyObject>(cmp));
    }
    
    /// Inserts a new element in the priority queue. The content of this new element is initialized to val.
    public func push(_ value: T) {
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
    
    /// The top element in the PriorityQueue.
    /// The top element is the element that compares higher in the PriorityQueue, and the next that is removed from the container when ``PriorityQueue/pop()`` is called.
    public var top: T {
        precondition(!q.empty())
        return q.top() as! T
    }
    
    /// Removes the element on top of the priority_queue, effectively reducing its size by one. The element removed is the one with the highest value.
    /// The value of this element can be retrieved before being popped by calling member ``PriorityQueue/top``.
    public func pop() {
        q.pop()
    }
    
    /// The number of elements in the priority queue.
    public var count: Int {Int(q.count())}
    
    /// A Boolean value indicating whether the priority queue is empty.
    public var isEmpty: Bool {q.empty()}
    
    var empty: Bool {q.empty()}
}
