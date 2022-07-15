import CxxSTL

/**
 LIFO stack
 Stacks are a type of container adaptor, specifically designed to operate in a LIFO context (last-in first-out), where elements are inserted and extracted only from one end of the container.

 stacks are implemented as container adaptors, which are classes that use an encapsulated object of a specific container class as its underlying container, providing a specific set of member functions to access its elements. Elements are pushed/popped from the "back" of the specific container, which is known as the top of the stack.

 The underlying container may be any of the standard container class templates or some other specifically designed container class. The container shall support the following operations:
 empty
 size
 back
 push_back
 pop_back

 The standard container classes vector, deque and list fulfill these requirements. By default, if no container class is specified for a particular stack class instantiation, the standard container deque is used.
 */
public class Stack<T>: NSObject {
    private var stack: _Stack<AnyObject>
    
    /// Creates a new, empty stack.
    /// ```swift
    /// let stack = Stack<Int>()
    /// ```
    public override init() {
        self.stack = _Stack<AnyObject>()
    }
    
    /// Inserts a new element at the top of the stack, above its current top element. The content of this new element is initialized to a copy of val.
    public func push(_ value: T) {
        switch value {
        case is Bool:
            let number: NSNumber = NSNumber(value: value as! Bool)
            stack.push(number)
            
        case is CChar:
            let number: NSNumber = NSNumber(value: value as! CChar)
            stack.push(number)
            
        case is Float:
            let number: NSNumber = NSNumber(value: value as! Float)
            stack.push(number)
            
        case is Double:
            let number: NSNumber = NSNumber(value: value as! Double)
            stack.push(number)
            
        case is Int:
            let number: NSNumber = NSNumber(value: value as! Int)
            stack.push(number)
        case is Int8:
            let number: NSNumber = NSNumber(value: value as! Int8)
            stack.push(number)
        case is Int16:
            let number: NSNumber = NSNumber(value: value as! Int16)
            stack.push(number)
        case is Int32:
            let number: NSNumber = NSNumber(value: value as! Int32)
            stack.push(number)
        case is Int64:
            let number: NSNumber = NSNumber(value: value as! Int64)
            stack.push(number)
            
        case is UInt:
            let number: NSNumber = NSNumber(value: value as! UInt)
            stack.push(number)
        case is UInt8:
            let number: NSNumber = NSNumber(value: value as! UInt8)
            stack.push(number)
        case is UInt16:
            let number: NSNumber = NSNumber(value: value as! UInt16)
            stack.push(number)
        case is UInt32:
            let number: NSNumber = NSNumber(value: value as! UInt32)
            stack.push(number)
        case is UInt64:
            let number: NSNumber = NSNumber(value: value as! UInt64)
            stack.push(number)
        default:
            stack.push(value as AnyObject)
        }
    }
    
    /// The top element in the stack.
    /// Since stacks are last-in first-out containers, the top element is the last element inserted into the stack.

    public var top: T {
        precondition(!stack.empty())
        return stack.top() as! T
    }
    
    /// Removes the element on top of the stack, effectively reducing its size by one.
    /// The element removed is the latest element inserted into the stack, whose value can be retrieved by calling member ``Stack/top``.
    public func pop() {
        stack.pop()
    }
    
    /// The number of elements in the stack.
    public var count: Int {Int(stack.count())}
    
    /// A Boolean value indicating whether the stack is empty.
    public var isEmpty: Bool {stack.empty()}
    
    var empty: Bool {stack.empty()}
}
