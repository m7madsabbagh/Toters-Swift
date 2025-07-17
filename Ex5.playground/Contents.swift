struct Stack<T>
{
    private var elements: [T] = []

    mutating func push(_ item: T)
    {
        elements.append(item)
    }

    mutating func pop() -> T?
    {
        return elements.popLast()
    }

    func peek() -> T?
    {
        return elements.last
    }

    var isEmpty: Bool
    {
        return elements.isEmpty
    }
}
var intStack = Stack<Int>()
intStack.push(10)
intStack.push(20)
print(intStack.pop() ?? "Empty")   // Output: 20
print(intStack.peek() ?? "Empty")  // Output: 10
print(intStack.isEmpty)            // Output: false

var stringStack = Stack<String>()
stringStack.push("Hello")
stringStack.push("World")
print(stringStack.peek() ?? "Empty") // Output: World
