import UIKit

public class Main {
    class func doMain() {
//        runSinglyLinkedList()
//        runDoublyLinkedList()
//        runBinarySearchTree()
        runHashTable()
    }
    
    class func runHashTable() {
        var hashTable = HashTable<String, String>(capacity: 5)
        hashTable["one"] = "Rafa"
        hashTable["two"] = "LEO"
        hashTable["three"] = "HICKKKK"
        
        print(hashTable["one"])
        print(hashTable["two"])
        print(hashTable["three"])
    }
    
    // MARK: - Binary Search Tree
    
    public class func runBinarySearchTree() {
        let binaryTree = BinaryTree<Int>()
//        binaryTree.insert(value: 1)
//        binaryTree.insert(value: 3)
//        binaryTree.insert(value: 5)
//        binaryTree.insert(value: 7)
//        binaryTree.insert(value: 9)
//        binaryTree.insert(value: 2)
//        binaryTree.insert(value: 4)
//        binaryTree.insert(value: 6)
//        binaryTree.insert(value: 8)
//        binaryTree.insert(value: 0)
        
//        binaryTree.insert(value: 1)
//        binaryTree.insert(value: 3)
//        binaryTree.insert(value: 5)
//        binaryTree.insert(value: 2)
//        binaryTree.insert(value: 4)
//        binaryTree.insert(value: 6)
//        binaryTree.insert(value: 7)
//        binaryTree.insert(value: 9)
//        binaryTree.insert(value: 8)
//        binaryTree.insert(value: 0)
        
        binaryTree.insert(value: 100)
        binaryTree.insert(value: 98)
        binaryTree.insert(value: 12)
        binaryTree.insert(value: 45)
        binaryTree.insert(value: 16)
        binaryTree.insert(value: 20)
        binaryTree.insert(value: 63)
        binaryTree.insert(value: 1)
        binaryTree.insert(value: 8)
        binaryTree.insert(value: 97)
        
        binaryTree.traverse()
        
        binaryTree.search(value: 12)
        binaryTree.search(value: 100)
        binaryTree.search(value: 98)
        
        print("calculate height for tree: \(binaryTree.calculateHeight())")
        
    }
    
    // MARK: - Singly LinkedList
    
    public class func runSinglyLinkedList() {
        let linkedList = SinglyLinkedList<String>()
        
        linkedList.push(value: "Hick")
        linkedList.push(value: "Leo")
        linkedList.push(value: "Rafa")
        
        print(linkedList)
        
        let node = linkedList.node(at: 0)
        print(node)
        
        linkedList.insertNode(previousNode: node!, value: "Fernando")
        print(linkedList)
        
        linkedList.pop()
        print(linkedList)
        
        linkedList.removeLast()
        print(linkedList)
        
    }
    
    // MARK: - Doubly LinkedList
    public class func runDoublyLinkedList() {
        let linkedList = DoublyLinkedList<String>()
        linkedList.append(value: "Rafa")
        linkedList.append(value: "Leo")
        linkedList.append(value: "Hick")
        linkedList.description
        
        let selectedNode = linkedList.nodeAt(index: 1)
        
        print(selectedNode?.value)
        
        if let node = selectedNode {
            linkedList.removeNode(node: node)
        }
        
        print(linkedList.description)
    }

    
}


Main.doMain()
