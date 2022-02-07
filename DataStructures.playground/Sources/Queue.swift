import Foundation

public protocol QueueProtocol {
  associatedtype Element
  mutating func enqueue(_ element: Element) -> Bool
  mutating func dequeue() -> Element?
  var isEmpty: Bool { get }
  var peek: Element? { get }
}

struct Queue<Element>: QueueProtocol {
    
    private var array: [Element] = []
    
    mutating func enqueue(_ element: Element) -> Bool {
        let didAppend = false
        array.append(element)
        return didAppend
    }
    
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : array.removeFirst()
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var peek: Element? {
        array.first
    }
    
    
}
