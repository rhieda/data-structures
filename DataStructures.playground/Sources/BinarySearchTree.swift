import Foundation

//https://medium.com/nickelfox/binary-search-tree-in-swift-9158aadbe6a3


public class TreeNode<T> {
    var value: T
    var leftNode: TreeNode<T>?
    var rightNode: TreeNode<T>?
    
    init(with value: T,
         leftNode: TreeNode<T>? = nil,
         rightNode: TreeNode<T>? = nil) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

public class BinaryTree<T: Comparable & CustomStringConvertible> {
    
    private var rootNode: TreeNode<T>?
    
    public init(){}
    
    public func insert(value: T) {
        let treeNode = TreeNode(with: value,
                                leftNode: nil,
                                rightNode: nil)
        
        if let rootNode = self.rootNode {
            insert(rootNode: rootNode, insertedNode: treeNode)
        } else {
            rootNode = treeNode
        }
    }
    
    private func insert(rootNode: TreeNode<T>,
                        insertedNode: TreeNode<T>) {
        if rootNode.value > insertedNode.value {
            if let leftNode = rootNode.leftNode {
                self.insert(rootNode: leftNode,
                            insertedNode: insertedNode)
            } else {
                rootNode.leftNode = insertedNode
            }
        } else {
            if let rightNode = rootNode.rightNode {
                self.insert(rootNode: rightNode,
                            insertedNode: insertedNode)
            } else {
                rootNode.rightNode = insertedNode
            }
        }
        
    }
    
    //Left Node Right
    public func inOrder(with node: TreeNode<T>?) {
        guard let innerNode = node else {
            return
        }
        inOrder(with: innerNode.leftNode)
        print("\(innerNode.value)")
        inOrder(with: innerNode.rightNode)
    }
    
    //Node Left Right
    public func preOrder(with node: TreeNode<T>?) {
        guard let innerNode = node else {
            return
        }
        print("\(innerNode.value), ")
        preOrder(with: innerNode.leftNode)
        preOrder(with: innerNode.rightNode)
    }
    
    //Left Right Node
    public func postOrder(with node: TreeNode<T>?) {
        guard let innerNode = node else {
            return
        }
        postOrder(with: innerNode.leftNode)
        postOrder(with: innerNode.rightNode)
        print("\(innerNode.value)")
    }
    
    public func search(value: T) {
        search(with: self.rootNode, value: value)
    }
    
    private func search(with node: TreeNode<T>?, value: T) {
        guard let currentNode = node else {
            return
        }
        
        if value > currentNode.value {
            search(with: currentNode.rightNode, value: value)
        } else if  value < currentNode.value {
            search(with: currentNode.leftNode, value: value)
        } else {
            //found value
            print("did Found value: \(value)")
        }
        
    }
    
    public func calculateHeight() -> Int {
        getHeight(with: rootNode)
    }
    
    private func getHeight(with node: TreeNode<T>?) -> Int {
        guard let rootNode = node else {
            return 0
        }
        
        let leftHeight = getHeight(with: rootNode.leftNode)
        let rightHeight = getHeight(with: rootNode.rightNode)
        return max(leftHeight, rightHeight) + 1
    }
    
    
    
}

extension BinaryTree {
   public func traverse() {
        print("InOrder")
        self.inOrder(with: rootNode)
        print("PreOrder")
        self.preOrder(with: rootNode)
        print("PostOrder")
        self.postOrder(with: rootNode)
    }
}
