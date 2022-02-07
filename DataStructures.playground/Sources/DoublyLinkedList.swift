import Foundation

public class DoublyNode<T> {
    public var value: T
    public var next: DoublyNode<T>?
    public weak var previous: DoublyNode<T>?
    public init(value: T) {
        self.value = value
    }
}
//https://www.raywenderlich.com/947-swift-algorithm-club-swift-linked-list-data-structure
public class DoublyLinkedList<T>: CustomStringConvertible {
    
    private var head: DoublyNode<T>?
    private var tail: DoublyNode<T>?
    
    public init() {}
    
    public func getHead() -> DoublyNode<T>? {
        return head
    }
    
    public func getTail() -> DoublyNode<T>? {
        return tail
    }
    
    public func isEmpty() -> Bool {
        return head == nil
    }
    
    public func append(value: T) {
        let node = DoublyNode<T>(value: value)
        
        if let currentTail = tail {
            node.previous = currentTail
            currentTail.next = node
        } else {
            head = node
        }
        
        tail = node
    }
    
    public func nodeAt(index: Int) -> DoublyNode<T>? {
        if index >= 0 {
            var node = head
            var internalIndex = index
            while node != nil {
                if internalIndex == 0 {
                    return node
                }
                internalIndex -= 1
                node = node?.next
            }
        }
        return nil
    }
    
    public func removeNode(node: DoublyNode<T>) {
        let nextNode: DoublyNode<T>? = node.next
        let previousNode: DoublyNode<T>? = node.previous
        
        if previousNode == nil {
            //head
            head = nextNode
        } else {
            previousNode?.next = nextNode
        }
        
        nextNode?.previous = previousNode
        
        if nextNode == nil {
            tail = nextNode
        }
        
        node.next = nil
        node.previous = nil
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public var description: String {
        let open = "["
        let close = "]"
        var text = String()
        var node = head
        while node != nil {
            text += "\(String(describing: node?.value))"
            node = node?.next
            if node != nil {
                text += ", "
            }
        }
        return open + text + close
    }
    
}

