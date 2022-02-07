import Foundation

public class SinglyNode<T> {
    public var next: SinglyNode<T>?
    public var value: T
    
    public init(value: T) {
        self.value = value
    }
    
}
//https://www.raywenderlich.com/books/data-structures-algorithms-in-swift/v3.0/chapters/6-linked-list
extension SinglyNode: CustomStringConvertible {

  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}

public class SinglyLinkedList<T>: CustomStringConvertible {
    private var head: SinglyNode<T>?
    private var tail: SinglyNode<T>?
    
    public var description: String {
      guard let head = head else {
        return "Empty list"
      }
      return String(describing: head)
    }
    
    public init() {}
    
    public func getHead() -> SinglyNode<T>? {
        return head
    }
    
    public func getTail() -> SinglyNode<T>? {
        return tail
    }
    
    public func push(value: T) {
        let newValue = SinglyNode(value: value)
        newValue.next = head
        
        head = newValue
        
        if tail == nil {
            tail = head
        }
        
    }
    
    public func append(value: T) {
        
        if isEmpty() {
            push(value: value)
        }
        let node = SinglyNode(value: value)
        tail?.next = node
        
        tail = tail?.next
        
    }
    
    public func node(at index: Int) -> SinglyNode<T>? {
        var currentIndex = index
        
        if index >= 0 {
            var someNode = getHead()
            while(someNode != nil) {
                if currentIndex == 0 {
                    return someNode
                }
                someNode = someNode?.next
                currentIndex -= 1
            }
        }
        
        return nil
    }
    
    @discardableResult
    public func insertNode(previousNode: SinglyNode<T>, value: T) -> SinglyNode<T>? {
        //check if they are same instance
        guard tail !== previousNode else {
            append(value: value)
            return tail
        }
        
        let newNode = SinglyNode(value: value)
        let nextNode = previousNode.next
        newNode.next = nextNode
        previousNode.next = newNode
        
        return newNode
        
    }
    
    @discardableResult
    public func pop() -> T? {
        defer {
          head = head?.next
          if isEmpty() {
            tail = nil
          }
        }
        return head?.value
    }
    
    @discardableResult
    public func removeLast() -> T? {
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return self.pop()
        }
        
        var previousNode = head
        var currentNode = head
        
        while let nextNode = currentNode.next {
            previousNode = currentNode
            currentNode = nextNode
        }
        
        previousNode.next = nil
        tail = previousNode
        
        return currentNode.value
    }
    
    @discardableResult
    public func remove(after node: SinglyNode<T>) -> T? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    
    func isEmpty() -> Bool {
        return head == nil
    }
        
}



