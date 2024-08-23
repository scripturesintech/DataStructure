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
        // Check if the lengths of the strings are the same
        guard str1.count == str2.count else {
            return false
        }

        // Create arrays to store the counts of each character in the strings
        var charCount1 = Array(repeating: 0, count: 256) // Assuming ASCII characters
        var charCount2 = Array(repeating: 0, count: 256)

        // Iterate through the characters in the first string and increment the count for each character
        for char in str1.utf8 {
            charCount1[Int(char)] += 1
        }

        // Iterate through the characters in the second string and decrement the count for each character
        for char in str2.utf8 {
            charCount2[Int(char)] += 1
        }

        // Compare the counts of each character in both arrays
        for i in 0..<256 {
            if charCount1[i] != charCount2[i] {
                return false
            }
        }

        // If all counts match, the strings are anagrams
        return true
    }

    func areAnagramsBestSolution(_ str1: String, _ str2: String) -> Bool {
        // Check if the lengths of the strings are the same
        guard str1.count == str2.count else {
            return false
        }

        // Create an array to store the counts of each character
       // var charCount = Array(repeating: 0, count: 256) // Assuming ASCII characters

        var charCount = [Int]()

        // Initialize charCount array with default values
        for _ in 0..<256 {
            charCount.append(0)
        }

        // Increment the count for each character in the first string
//        for char in str1.utf8 {
//            charCount[Int(char)] += 1
//        }
//
//        // Decrement the count for each character in the second string
//        for char in str2.utf8 {
//            charCount[Int(char)] -= 1
//        }

        for (char1, char2) in zip(str1, str2) {
            charCount[Int(char1.asciiValue!)] += 1
            charCount[Int(char2.asciiValue!)] -= 1
        }

        // Check if all counts are zero
        for count in charCount {
            if count != 0 {
                return false
            }
        }

        // If all counts are zero, the strings are anagrams
        return true
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

    func newAnagram(str1: String, str2: String) -> Bool {
        
        guard str1.count == str2.count else { return false }
        // Step 1
        var charArray1 = Array(repeating: 0, count: str1.count)
        var charArray2 = Array(repeating: 0, count: str2.count)
        
        // Step 2
        for char in str1.utf8 {
            charArray1[Int(char)] += 1
        }
        
        for char in str2.utf8 {
            charArray2[Int(char)] += 1
        }
        
        // Step 3
        for i in 0...256 {
            if charArray1[i] != charArray2[i] {
                return false
            }
        }
        return false
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
    var frequencyDict1 = [Character: Int]()
    var frequencyDict2 = [Character: Int]()

    // Populate the frequency dictionary for the first string
    for char in s1 {
        frequencyDict1[char, default: 0] += 1
    }

    // Populate the frequency dictionary for the second string
    for char in s2 {
        frequencyDict2[char, default: 0] += 1
    }

    // Compare the two frequency dictionaries
    return frequencyDict1 == frequencyDict2
}
    
 func binaryRepresentation(of number: Int) -> String {
    return String(number, radix: 2)
}

func integerFromBinary(_ binaryString: String) -> Int? {
    return Int(binaryString, radix: 2)
}

}



