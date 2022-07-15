import CxxSTL

/**
 FIFO queue, queues are a type of container adaptor, specifically designed to operate in a FIFO context (first-in first-out), where elements are inserted into one end of the container and extracted from the other.

 Queues are implemented as containers adaptors, which are classes that use an encapsulated object of a specific container class as its underlying container, providing a specific set of member functions to access its elements. Elements are pushed into the "back" of the specific container and popped from its "front".
 */
public class Queue<T>: NSObject {
    private var q: _Queue<AnyObject>
    
    /// Creates a new, empty queue.
    /// ```swift
    /// let queue = Queue<Int>()
    /// ```
    public override init() {
        self.q = _Queue<AnyObject>()
    }
    
    /// Inserts a new element at the end of the queue, after its current last element. The content of this new element is initialized to val.

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
   
    /// The next element in the queue.
    /// The next element is the "oldest" element in the queue and the same element that is popped out from the queue when ``Queue/pop`` is called.
    public var front: T {
        precondition(!q.empty())
        return q.front() as! T
    }
    
    ///  The last element in the queue. This is the "newest" element in the queue (i.e. the last element pushed into the queue).
    public var back: T {
        precondition(!q.empty())
        return q.back() as! T
    }
    
    
    /// Removes the next element in the queue, effectively reducing its size by one.
    /// The element removed is the "oldest" element in the queue whose value can be retrieved by calling member ``Queue/front``.
    public func pop() {
        q.pop()
    }
    
    /// The number of elements in the queue.
    public var count: Int {Int(q.count())}
    
    /// A Boolean value indicating whether the queue is empty.
    public var isEmpty: Bool {q.empty()}
    
    var empty: Bool {q.empty()}
}
