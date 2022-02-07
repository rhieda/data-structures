import Foundation
//http://raywenderlich.github.io/swift-algorithm-club/Hash%20Table/
public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    
    private var buckets: [Bucket]
    
    private(set) var count = 0
    
    public var isEmpty: Bool { return count == 0 }

    public init(capacity: Int) {
      assert(capacity > 0)
      buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    
    private func index(forKey key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        } set {
            if let value = newValue {
                _ = updateValue(forKey: key, value: value)
            } else {
                _ = removeValue(forKey: key)
            }
        }
    }
    
    private func value(forKey key: Key) -> Value? {
        let index = index(forKey: key)
        
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    private mutating func updateValue(forKey key: Key, value: Value) -> Value? {
        let index = index(forKey: key)
        
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    public mutating func removeValue(forKey key: Key) -> Value? {
      let index = self.index(forKey: key)

      for (i, element) in buckets[index].enumerated() {
        if element.key == key {
          buckets[index].remove(at: i)
          count -= 1
          return element.value
        }
      }
      return nil  // key not in hash table
    }
}
