import CxxSTL

/**
 ForwardLists are sequence containers that allow constant time insert and erase operations anywhere within the sequence.

 Forward lists are implemented as singly-linked lists; Singly linked lists can store each of the elements they contain in different and unrelated storage locations. The ordering is kept by the association to each element of a link to the next element in the sequence.

 The main design difference between a forward_list container and a list container is that the first keeps internally only a link to the next element, while the latter keeps two links per element: one pointing to the next element and one to the preceding one, allowing efficient iteration in both directions, but consuming additional storage per element and with a slight higher time overhead inserting and removing elements. forward_list objects are thus more efficient than list objects, although they can only be iterated forwards.

 Compared to other base standard sequence containers (array, vector and deque), forward_list perform generally better in inserting, extracting and moving elements in any position within the container, and therefore also in algorithms that make intensive use of these, like sorting algorithms.

 The main drawback of forward_lists and lists compared to these other sequence containers is that they lack direct access to the elements by their position; For example, to access the sixth element in a forward_list one has to iterate from the beginning to that position, which takes linear time in the distance between these. They also consume some extra memory to keep the linking information associated to each element (which may be an important factor for large lists of small-sized elements).

 The forward_list class template has been designed with efficiency in mind: By design, it is as efficient as a simple handwritten C-style singly-linked list, and in fact is the only standard container to deliberately lack a size member function for efficiency considerations: due to its nature as a linked list, having a size member that takes constant time would require it to keep an internal counter for its size (as list does). This would consume some extra storage and make insertion and removal operations slightly less efficient. To obtain the size of a forward_list object, you can use the distance algorithm with its begin and end, which is an operation that takes linear time.
 */
public class ForwardList<T>: NSObject {
    private var list: _ForwardList<AnyObject>
    private var _index = 0
    
    /// Creates a new, empty ForwardList.
    /// ```swift
    /// let l = ForwardList<Int>()
    /// ```
    public override init() {
        self.list = _ForwardList<AnyObject>()
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
    
    /**
     Removes the first element of the container. If there are no elements in the container, the behavior is undefined.
     */
    public func popFront() {
        list.pop_front()
    }
    
    /// Returns a Boolean value that indicates whether the given element exists in the forward list.
    public func contains(_ elem: T) -> Bool {
        return list.contains(elem)
    }
    
    /// Removes the element at index.
    public func erase(_ index: Int) {
        list.erase(Int32(index))
    }
    
    func nth(_ index: Int) -> T {
        let value: T = list.nth(Int32(index)) as! T;
        return value
    }
    
    /// The number of elements in the forward list.
    public var count: Int {Int(list.count())}
    
    /// A Boolean value indicating whether the forward list is empty.
    public var isEmpty: Bool {list.empty()}
    
    var empty: Bool {list.empty()}
}

extension ForwardList: Sequence, IteratorProtocol {
    public typealias Element = T
    
    public func next() -> T? {
        if _index < self.count {
            let value: T = nth(_index)
            _index += 1;
            return value
        } else {
            return nil
        }
    }
}
