//
//  ViewController.swift
//  DataStructure
//
//  Created by Roopesh Tripathi on 21/04/24.
//

import UIKit

class ClassA {
    var objectB: ClassB?

    deinit {
        print("ClassA deinitialized")
    }
}

class ClassB {
    var objectA: ClassA?

    deinit {
        print("ClassB deinitialized")
    }
}

class Person {
    let name: String
    var pet: Pet?

    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }

    deinit {
        print("\(name) is deinitialized")
    }
}

class Pet {
    let name: String
    unowned var owner: Person?

    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }

    deinit {
        print("\(name) is deinitialized")
    }
}

struct BankAccount {
    var name: String
    var isMillionnaire = false
    var balance: Int {
        didSet {
            if balance > 1_000_000 {
                isMillionnaire = true
            } else {
                isMillionnaire = false
            }
        }
    }
}

struct App {
    var name: String
    var isOnSale: Bool {
        didSet {
            if isOnSale {
                print("Go and download my app!")
            } else {
                print("Maybe download it later.")
            }
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // Example usage:
        let inputString = "hello world"
        let occurrences = characterOccurrences(in: inputString)

        for (char, count) in occurrences {
            print("'\(char)' occurs \(count) time(s)")
        }
        
        let s = "yoda is a jedi"
        let reversed = reverseWords(in: s)
        print(reversed) // Output: "jedi a is yoda"
        
        let testString1 = "The quick brown fox jumps over the lazy dog"
        print(panagram(testString1))
      
        var increment = makeIncrementer()
        print(increment(7))
        // Example usage:
        let string1 = "LISTEN"
        let string2 = "SILENT"
        
        if areAnagramsBestSolution(string1, string2) {
            print("'\(string1)' and '\(string2)' are anagrams.")
        } else {
            print("'\(string1)' and '\(string2)' are not anagrams.")
        }
        
        // Example usage:
        let string1 = "listen"
        let string2 = "silent"

        print(reverseWordInSentence(with: "hello world"))

        var objectA: ClassA? = ClassA()
        var objectB: ClassB? = ClassB()

        objectA?.objectB = objectB
        objectB?.objectA = objectA

        objectA = nil
        objectB = nil

        var john: Person? = Person(name: "John")
        var dog: Pet? = Pet(name: "Fido")

        john?.pet = dog
        dog?.owner = john

        john = nil
        dog = nil
      
       // var rangeOfThreeItems = FixedLengthRange(firstValue: <#T##Int#>, length: <#T##Int#>)
      // the range represents integer values 0, 1, and 2
        
        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

        // bubbleSort Example usage:
        var numbers = [5, 3, 9, 2, 8, 4, 7]
        bubbleSort(&numbers)
        print(numbers) // Output: [2, 3, 4, 5, 7, 8, 9]

        var strings = ["banana", "apple", "orange", "grape"]
        bubbleSort(&strings)
        print(strings) // Output: ["apple", "banana", "grape", "orange"]

        // quickSort Example usage:
        quickSort(&numbers)
        print(numbers) // Output: [2, 3, 4, 5, 7, 8, 9]

        let number = 123456
        let resveredInt = reverseIntArray(with: number)
        print(resveredInt)

        let statement = ""
        let reverseString = newReverseString(text: statement)
        print(reverseString)
         */
    }

    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }

    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1

        while left < right {
            let temp = s[left]
            s[left] = s[right]
            s[right] = temp

            left += 1
            right -= 1
        }
    }

    func reverseWordInSentence(text: String) -> String {
        var reversedStatement = ""
        for character in text {
            print("get text: \(character)")
            reversedStatement = String(character) + reversedStatement
            print("reverse text: \(reversedStatement)")
        }
        return reversedStatement
    }

    func swapValues<T>(_ a: inout T, _ b: inout T) {
        let temp = a
        a = b
        b = temp
    }

    func bubbleSort<T: Comparable> (_ array: inout [T]) {
        guard !array.isEmpty else { return }
        var swapped = false

        for i in 0..<array.count {

            for j in 0..<array.count - 1 - i {

                if array[j] > array[j+1] {
                    do {
                        let temp = array [j]
                        array[j] = array[j+1]
                        array[j+1] = temp
                    }
                    swapped = true
                }
            }
            if !swapped {
                break
            }
        }
    }

    func quickSort<T: Comparable>(_ array: inout [T]) {
        // Check for empty or single-element array
        guard array.count > 1 else {
            return
        }

        // Call the quick sort helper function
        quickSortHelper(&array, low: 0, high: array.count - 1)
    }

    func quickSortHelper<T: Comparable>(_ array: inout [T], low: Int, high: Int) {
        if low < high {
            // Partition the array and get the pivot index
            let pivotIndex = partition(&array, low: low, high: high)

            // Recursively sort the sub-arrays before and after the pivot
            quickSortHelper(&array, low: low, high: pivotIndex - 1)
            quickSortHelper(&array, low: pivotIndex + 1, high: high)
        }
    }

    func partition<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
        // Choose the pivot element (for simplicity, we choose the last element)
        let pivot = array[high]

        // Initialize the index of the smaller element
        var i = low

        // Partitioning the array
        for j in low..<high {
            if array[j] <= pivot {
                array.swapAt(i, j)
                i += 1
            }
        }

        // Swap the pivot element with the element at index i (place the pivot in its correct position)
        array.swapAt(i, high)

        // Return the index of the pivot element
        return i
    }

    func reverseIntArray(with x: Int) -> Int {

        var num = x
        var result = 0
        
        while num != 0 {
            //digit
            var digit = num % 10
            // store result
            result = result * 10 + digit
            //
            num /= 10
        }
        
        return result
    }

 func areAnagrams(_ str1: String, _ str2: String) -> Bool {
    // Early exit if lengths differ
    guard str1.count == str2.count else {
        return false
    }

    // Initialize an array to count character occurrences (256 for all ASCII characters)
    var charCount = [Int](repeating: 0, count: 256)

    // Helper function to get ASCII index for character
    func index(for char: Character) -> Int {
        return Int(char.asciiValue ?? 0)
    }

    // Count characters from the first string
    for char in str1 {
        charCount[index(for: char)] += 1
    }

    // Subtract counts for characters in the second string
    for char in str2 {
        charCount[index(for: char)] -= 1
    }

    // Check if all counts are zero
    return charCount.allSatisfy { $0 == 0 }
}

    func reverseWordInSentence(with input: String) -> String {

        var reversedString = ""
        var wordStartIndex = input.startIndex
        var wordEndIndex = input.endIndex

        // Reverse the last word and append it to the reversed string
        reversedString = String(input[wordStartIndex..<wordEndIndex]) + reversedString

        return reversedString
    }
    
    func removeDuplicates<T: Equatable>(from array: [T]) -> [T] {
        var results: [T] = []
        for element in array {
            if !results.contains(element) {
                results.append(element)
            }
            
        }
        return results
    }
    
    func removeDuplicateItems<T: Equatable>(from array: [T]) -> [T] {
        
        var results: [T] = []
        for el in array {
            
            if !results.contains(el) {
                results.append(el)
            }
        }
        return results
    }

    func reverseWord(input: String) -> String {
        var result: String = ""
        for el in input {
            result = String(el) + result
        }
        return result
    }

    func panagram(_ str: String) -> Bool {
        var charSet: Set<Character> = Set()

        for char in str.lowercased() {
            if char.isLetter {
                charSet.insert(char)
            }
        }

        return charSet.count == 26
    }

    func reverseWords(in s: String) -> String {
    // Split the string into words
    let words = s.split(separator: " ")
    var reversedWords: [String] = []
    
    // Iterate through the array from the last element to the first using a decrementing index
    var i = words.count - 1
    while i >= 0 {
        reversedWords.append(String(words[i]))
        i -= 1
    }
    
    // Join the reversed words back into a single string
    let reversedString = reversedWords.joined(separator: " ")
    
    return reversedString
}
    func reverseWordInSentence(with input: String) -> String {
    var reversedString = ""
    var currentWord = ""
    
    for character in input {
        if character == " " {
            // Prepend the word to the reversed string
            reversedString = currentWord + " " + reversedString
            // Reset currentWord for the next word
            currentWord = ""
        } else {
            // Build the current word
            currentWord += String(character)
        }
    }
    
    // Add the last word to the reversed string (since there might not be a space after it)
    reversedString = currentWord + (reversedString.isEmpty ? "" : " ") + reversedString
    
    return reversedString
}

func characterOccurrences(in string: String) -> [Character: Int] {
    var occurrences: [Character: Int] = [:]
    
    for char in string {
        occurrences[char, default: 0] += 1
    }
    
    return occurrences
}

func gcd(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    
    while b != 0 {
        let remainder = a % b
        a = b
        b = remainder
    }
    
    return a
}

func gcdOfArray(_ numbers: [Int]) -> Int {
    guard let first = numbers.first else { return 0 }
    return numbers.dropFirst().reduce(first) { gcd($0, $1) }
}

let numbers = [56, 98, 42]
let result = gcdOfArray(numbers)
print(result) // Output: 14

 func printDivisors(of n: Int) {
    var divisors = [Int]()
    
    for i in 1...Int(Double(n).squareRoot()) {
        if n % i == 0 {
          divisors.append(i)
              if i != n / i {
                divisors.append(n / i)
                }
            }
        }
    
    // Sort and print the divisors
     divisors.sort()
     print(divisors)
}

func maxSubArray(_ nums: [Int]) -> Int {
    // Initialize the variables
    var currentMax = nums[0]
    var globalMax = nums[0]

    // Iterate through the array starting from the second element
    for i in 1..<nums.count {
        // Decide whether to add the current element to the existing subarray or start a new subarray
        currentMax = max(nums[i], currentMax + nums[i])
        
        // Update the global maximum if the current subarray sum is greater
        if currentMax > globalMax {
            globalMax = currentMax
        }
    }

    return globalMax
}

    func mergeSortedArrays(_ array1: [Int], _ array2: [Int]) -> [Int] {
    var mergedArray: [Int] = []
    var i = 0  // Pointer for array1
    var j = 0  // Pointer for array2

    // Step 1: Merge the arrays while both pointers are within bounds
    while i < array1.count && j < array2.count {
        if array1[i] < array2[j] {
            mergedArray.append(array1[i])
            i += 1
        } else {
            mergedArray.append(array2[j])
            j += 1
        }
    }

    // Step 2: Add the remaining elements from array1, if any
    while i < array1.count {
        mergedArray.append(array1[i])
        i += 1
    }

    // Step 3: Add the remaining elements from array2, if any
    while j < array2.count {
        mergedArray.append(array2[j])
        j += 1
    }

    return mergedArray
}
    
func areAnagrams(_ s1: String, _ s2: String) -> Bool {
    // Early exit if strings have different lengths
    guard s1.count == s2.count else {
        return false
    }
    // Create frequency dictionaries for both strings
    var frequencyDict = [Character: Int]()
    
    // Populate the frequency dictionary for the first string
    for char in s1 {
        frequencyDict[char, default: 0] += 1
    }

    // Populate the frequency dictionary for the second string
    for char in s2 {
        frequencyDict[char, default: 0] -= 1
    }
  return frequencyDict.values.allSatisfy { $0 == 0 }
}
    
 func binaryRepresentation(of number: Int) -> String {
    return String(number, radix: 2)
}

func integerFromBinary(_ binaryString: String) -> Int? {
    return Int(binaryString, radix: 2)
}
    
 func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else { return nums.count }
    var i = 0
    for j in 1..<nums.count {
        if nums[i] != nums[j] {
            i += 1
            nums[i] = nums[j]

        }
    }
    return i + 1

  //   var nums = [1, 1, 2, 2, 3]
//let length = removeDuplicates(&nums)
//print(length)  // Output: 3
// let uniqueArray = Array(nums[0..<length])
//print(nums.prefix(length))  // Output: [1, 2, 3]
    }    

    func removeDuplicates<T: Hashable>(from array: [T]) -> [T] {
    var uniqueArray: [T] = []
    var seenElements: [T: Bool] = [:]  // Dictionary to track seen elements
    
    for element in array {
        if seenElements[element] == nil {  // If element hasn't been seen yet
            uniqueArray.append(element)    // Add it to the unique array
            seenElements[element] = true   // Mark it as seen
        }
    }
    
    return uniqueArray
}
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let sum = nums[left] + nums[right]
        if sum == target {
            return [left + 1, right + 1]  // Return 1-indexed positions
        } else if sum < target {
            left += 1  // Move left pointer to the right
        } else {
            right -= 1  // Move right pointer to the left
        }
    }
    
    return []  // If no solution found, though the problem guarantees one
}
func compressString(_ string: String) -> String {
    // Edge case: if the string is empty, return an empty string
    guard !string.isEmpty else { return "" }

    var compressedString = ""
    var currentChar = string.first!  // Start with the first character
    var count = 0
    
    // Iterate through the string
    for char in string {
        if char == currentChar {
            // If the current character is the same as the previous one, increment the count
            count += 1
        } else {
            // Append the previous character and its count to the result
            compressedString += "\(currentChar)\(count)"
            currentChar = char  // Update to the new character
            count = 1  // Reset the count
        }
    }
    
    // Don't forget to append the last character and its count
    compressedString += "\(currentChar)\(count)"
    
    return compressedString
}
    func reverseString(_ str: String) -> String {
    var start: Int = 0
    var end: Int = str.count - 1
    var inputArray = Array(str)  // Convert the string into an array of characters
    var result = ""

    while start < end {
        let temp = inputArray[start]
        inputArray[start] = inputArray[end]
        inputArray[end] = temp
        
        start += 1
        end -= 1
    }

    result = String(inputArray)  // Convert the character array back to a string
    
    return result
}

func fibonacci(_ n: Int) -> Int {
    if n <= 1 { return n }
    
    var dp = Array(repeating: 0, count: n + 1)
    dp[0] = 0
    dp[1] = 1
    
    for i in 2...n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    
    return dp[n]
   // Example usage:
   // let n = 10
    // print("Fibonacci number at position \(n) is \(fibonacci(n))")
}

 func moveZeros(_ nums: inout [Int]) {
    var lastNonZeroIndex = 0  // Pointer to track the position of the last non-zero element

    // Iterate through the array
    for i in 0..<nums.count {
        if nums[i] != 0 {
            // Swap the non-zero element with the element at lastNonZeroIndex
            nums.swapAt(i, lastNonZeroIndex)
            lastNonZeroIndex += 1  // Move the pointer forward
        }
    }

// Example usage:
//var nums = [0, 1, 0, 3, 12]
//moveZeros(&nums)
//print(nums)  // Output: [1, 3, 12, 0, 0]
}
func maxSubArray(_ nums: [Int]) -> (maxSum: Int, subArray: [Int]) {
    var currentSum = nums[0]
    
    // Initialize maxSum to the smallest possible value
    var maxSum = Int.min
    
    // Indices to track the start and end of the maximum sum subarray
    var start = 0
    var end = 0
    var tempStart = 0
    
    for i in 0..<nums.count {
        // If adding the current element decreases the current sum, reset to current element
        if nums[i] > currentSum + nums[i] {
            currentSum = nums[i]
            tempStart = i  // Start new subarray
        } else {
            currentSum += nums[i]
        }
        
        // If currentSum is greater than maxSum, update maxSum and track indices
        if currentSum > maxSum {
            maxSum = currentSum
            start = tempStart
            end = i
        }
    }
    
    // Extract the subarray that has the maximum sum
    let subArray = Array(nums[start...end])
    
    return (maxSum, subArray)

    // Example usage:
//let nums = [-2, -3, -4, -1, -5]
//let result = maxSubArray(nums)
//print("Maximum sum is \(result.maxSum)")  // Output: -1
//print("Subarray with maximum sum is \(result.subArray)")  // Output: [-1]
}





}



