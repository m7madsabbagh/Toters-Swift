func fizzBuzz(_ n: Int) -> [String] {
    var array: [String] = []

    for i in 1...n
    {
        if i % 5 == 0 && i % 3 == 0
        {
            array.append("FizzBuss")
        }
        else if i % 3 == 0
        {
            array.append("Fizz")
        }
        else if i % 5 == 0
        {
            array.append("Buzz")
        }
        else
        {
            array.append(String(i))
        }
    }
    return array
}

fizzBuzz(14)
