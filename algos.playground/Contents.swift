//: Playground - noun: a place where people can play
import UIKit

var str = "Hello, playground"

/* My learning testing for range issues */
let chars = [Character](str.characters)
let startIndex = str.characters.startIndex
let endIndex = str.characters.endIndex
str[startIndex]
str[str.index(before:endIndex)]
str[str.index(after: startIndex)]
str[str.index(startIndex, offsetBy:3)]
str[str.index(endIndex, offsetBy:-3)]
str[startIndex..<str.index(endIndex,offsetBy:-3)]
let rangeOFPlay = str.range(of: "play")
str.removeSubrange(rangeOFPlay!)
str.insert(contentsOf:"Sims".characters, at: (rangeOFPlay?.lowerBound)!)
str.insert(contentsOf:"Preet".characters, at: (rangeOFPlay?.upperBound)!)




var myArray = [1,2,3,4,5]
let index = myArray[0]
var names = ["Sandeep","Simran","John","Avin","Harry"]

func backward(_ s1:String,s2:String) -> Bool{
    return s1 > s2
}

var reversedArray = names.sorted(by:backward) //inline closure

var reversedNames = names.sorted(by:{(s1:String,s2:String) -> Bool in   //closure expression
    return s1 > s2
    }
)

reversedNames = names.sorted(by: { $0 > $1 })
reversedNames

reversedNames.remove(at: 0)

reversedNames.removeAll(keepingCapacity: true)
reversedNames

reversedNames.count
names
names.removeLast()
names
names.append(names[0])
names

func findNonRepeatingCharacters(_ inputArray:[String]) {
    
}
let a = String(true)            // from boolean: "true"

let fullName = "First Last"
let fullNameArray = [Character](fullName.characters)
let reversediput = String(fullNameArray.reversed())

var arr = fullName.characters.map { String($0) }
arr

//MARK:find non repeating characters in a string
func countCharactersInString(_ inputString:String) {
    let inputCharArray = [Character](inputString.characters)
    
    for (index,element) in inputCharArray.enumerated() {
        print("first loop testing:\(index)\(element)")
    }
    var counts = [Character: Int]()
    
    for character in inputCharArray {
        if(counts[character] != nil) {
            counts[character] = (counts[character] ?? 0) + 1
        }
        else {
            counts[character] = 1
        }
    }
    for (key, value) in counts{
        if(value > 1) {
            print(key)
        }
    }
    let nonRepeatingChars = inputCharArray.filter({counts[$0] == 1})
    nonRepeatingChars
    nonRepeatingChars.first
}
var inputString = "abcdab"
countCharactersInString("simranpreet")


//MARK:find number of vowels in a word
func numberOfVowels(_ inputString:String)-> Int {
    var vowelcount = 0
    let vowels: [Character] = ["a","e","i","o","u"]
    for ch in [Character](inputString.lowercased().characters) {
        if (vowels.contains(ch)) {
            vowelcount += 1
        }
    }
    return vowelcount
}
numberOfVowels("simranpreet")

//MARK:1.find missing numbers inan array from 1 to 100
func getMissingInts(_ inputArray:Array<Int>) -> Array<Int> {
    var missingNumbers = [Int]()
    var previousNumber:Int = inputArray[0]
    for i in 1..<inputArray.count {
        if( inputArray[i] - previousNumber != 1) {
            missingNumbers.append(previousNumber + 1)
        }
        previousNumber = inputArray[i]
    }
    return missingNumbers
}
var intArray: [Int] = [1,2,4,6,8,9]
getMissingInts(intArray)

//MARK:3.find smallest and largest numberin an array
func minAndMaxValue(_ inputArray:[Int]){
    var largest = Int.min
    var smallest = Int.max
    for element in inputArray {
        if(element > largest) {
            largest = element
        }
        if(element < smallest) {
            smallest = element
        }
    }
    print ("Largest in array: \(largest)")
    print ("Smallest in array: \(smallest)")
}
minAndMaxValue(intArray)

//MARK:5.find pairs of int array whose sum is equal to a given number
func findPairSum(_ inputArray:[Int], givenNumber:Int) {
    for i in 0..<inputArray.count {
        let firstNumber = inputArray[i]
        for j in i+1..<inputArray.count {
            let secondNumber = inputArray[j]
            if(firstNumber+secondNumber == givenNumber) {
                print("Two pairs are: \(firstNumber), \(secondNumber)")
            }
        }
    }
}
findPairSum([2, 4, 3, 5, 6, -2, 4, 7, 8, 9],givenNumber: 7)
//MARK:2.find duplicate numbers in an int array
func findDuplicates(_ inputArray:[Int]) -> Array<Int> {
    var duplicateNumbers = [Int]()
    for i in 0..<inputArray.count {
        var previousNumber:Int = inputArray[i]
        for j in i+1..<inputArray.count {
            if( previousNumber == inputArray[j] && !duplicateNumbers.contains(previousNumber)) {
                duplicateNumbers.append(previousNumber)
            }
        }
        previousNumber = inputArray[i]
    }
    return duplicateNumbers
}

var duplicateArray:[Int] = [2,2,3,4,5,5,5,6,7,7,7,7]
findDuplicates(duplicateArray)
findDuplicates([2,4,2,5,6,3,5,3])

//MARK:7.WAP to remove duplicates from an array
func removeDuplicates(_ inputArray:[Int]) -> Array<Int> {
    var newArray = [Int]()
    var current:Int = inputArray[0]
    var found = false
    for i in 0..<inputArray.count {
        if(current == inputArray[i] && !found) {
            newArray.append(inputArray[i])
            found = true
        }
        else if(current != inputArray[i]) {
            newArray.append(inputArray[i])
            current = inputArray[i]
        }
    }
    return newArray
}
removeDuplicates(duplicateArray)


//MARK:8.WAP to sort an array using quick sort
func quicksort<T: Comparable>(_ inputArray: [T]) -> [T] {
    guard inputArray.count > 1 else {
        return inputArray
    }
    
    let pivot = inputArray[inputArray.count/2]
    let less = inputArray.filter { $0 < pivot }
    let equal = inputArray.filter { $0 == pivot }
    let greater = inputArray.filter { $0 > pivot }

    return quicksort(less) + equal + quicksort(greater)
}
let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
quicksort(list)

//
////MARK:9.find intersection of two sorted array
func findArrayIntersection(_ array1:[Int], _ array2:[Int]) -> [Int] {
    var intersectionArray = [Int]()
    
    for array1Element in array1 {
        for array2Element in array2 {
            if(array2Element == array1Element && !intersectionArray.contains(array1Element)) {
                intersectionArray.append(array1Element)
            }
        }
    }
    return intersectionArray
}

findArrayIntersection([1,22,13,54,3], [1,22,33,54,22])
//
////MARK:10.find an element which is non-repeated in an repeatedArray
func findNonRepeatedElement(_ inputArray:[Int]) -> [Int]{
    var nonRepeatingArray = [Int]()
    var current:Int = inputArray[0]
    var found = false
    for i in 0..<inputArray.count {
        if(current == inputArray[i]) {
            nonRepeatingArray.append(inputArray[i])
            found = true
        }
        else if(current != inputArray[i]) {
            //nonRepeatingArray.append(inputArray[i])
            current = inputArray[i]
        }
    }
    return nonRepeatingArray
}
findNonRepeatedElement([34,4,2,5,3,4,7,8])

//
////MARK:11.find kth smallest eleemnt in an unsorted array
//func findKthSmallestElement(_ inputArray:[Int], int k) {
//    
//}
//
////MARK:13.find common elements in three sorted array
func findCommmonElementsIn3SortedArray(_ array1:[Int],_ array2:[Int],_ array3:[Int]) {
    var i = 0,j = 0,k = 0
    
    while(i < array1.count && j < array2.count && k < array3.count) {
        if(array1[i] == array2[j] && array2[j] == array3[k]) {
            print (array1[i])
            i += 1
            j += 1
            k += 1
        }
        else if(array2[j] > array1[i]) {
            i += 1
        }
        else if(array3[k] > array2[j]) {
           j += 1
        }
        else {
            k += 1
        }
    }
}
findCommmonElementsIn3SortedArray([1, 5, 10, 20, 40, 80],[6, 7, 20, 80, 100],[3, 4, 15, 20, 30, 70, 80, 120])

//
////MARK:14.find first repeating eleemnt in an array
//func findFirstRepeatingElement(_ inputArray:[Int]) -> Int {
//    
//}
//
////MARK:15.find first non-repeating eleemnt in an array
//func findFirstNonRepeatingElement(_ inputArray:[Int]) {
//    
//}
//
////MARK:16.find top two numbers from an integer array
//func findTopTwoNumbers(_ inputArray:[Int]) {
//    
//}

//findNonRepeatingCharacters(split(inputString))
