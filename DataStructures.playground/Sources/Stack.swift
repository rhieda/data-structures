import Foundation

struct Stack<T> {
    var items: [T] = []
    
    func peek() -> T? {
        guard let item  = items.first else {
            return nil
        }
        
        return item
    }
    
    @discardableResult
    mutating func pop() -> T? {
        guard let item = items.first else {
            return nil
        }
        
        let removedItem = item
        items.removeFirst()
        return removedItem
    }
    
    mutating func push(item: T) {
        items.insert(item, at: 0)
    }
    
}
