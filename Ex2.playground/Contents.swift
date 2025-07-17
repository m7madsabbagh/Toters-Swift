
func sumOfSquaredEvenMultiples(_ n: Int, k: Int) -> Int {
    var sum = 0
    for i in 1...n
    {
        if i % 2 == 0 && i % k == 0
        {
            sum += i * i
        }
    }
    return sum
}

print(sumOfSquaredEvenMultiples(10, k: 3))


