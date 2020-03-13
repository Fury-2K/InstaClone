import Foundation

/* MARK: - Codable and decodable
 
 struct User: Codable {
 var name: String
 var phoneNum: Int
 var email: String
 var subjects: [String]
 }
 
 let jsonFile = """
 {
 "name": "TestUser",
 "phoneNum": 123456789,
 "email": "testUser@asd.com",
 "subjects": ["abc", "def", "ghi"]
 }
 """
 
 let jsonData = jsonFile.data(using: .utf8)!
 do {
 let user = try JSONDecoder().decode(User.self, from: jsonData)
 print(user.name)
 print(user.phoneNum)
 print(user.subjects)
 } catch {
 print(error.localizedDescription)
 }
 */


/* MARK: - inout working
 
 var testString: String = "Test String"
 
 func checkInoutWorking(_ oldString: inout String) -> String {
 oldString = "Test String Changed"
 return oldString
 }
 print(testString)
 print(checkInoutWorking(&testString))
 */


/* MARK: - Bubble Sort
 
 var arr: [Int] = [4, 8, 6, 5, 2]
 print(arr)
 for i in 0..<arr.count {
 for j in 0..<i {
 if arr[i] < arr[j] {
 arr.swapAt(i, j)
 }
 }
 }
 
 print(arr)
 */


/* MARK: - 2D Array Problem
 
 let matrix: [[Int]] = [
 [4, 7, 2, 4],
 [1, 6, 7],
 [8, 9 ,6]
 ]
 
 func isValid(_ arr: [Int], _ index: Int) -> Bool {
 return arr.indices.contains(index)
 }
 
 func getMaxSum() {
 var maxSum = 0
 for rowIndex in 0...(matrix.count - 3) {
 var i = 0
 while isValid(matrix[rowIndex], i + 2) {
 let firstRow = matrix[rowIndex]
 let secondRow = matrix[rowIndex + 1]
 let thirdRow = matrix[rowIndex + 2]
 let localSum: Int = firstRow[i] + firstRow[i + 1] + firstRow[i + 2] + secondRow[i + 1] + thirdRow[i] + thirdRow[i+1] + thirdRow[i+2]
 print("Local - ", localSum)
 maxSum = max(maxSum, localSum)
 i += 1
 }
 }
 print(maxSum)
 }
 
 getMaxSum()
 */


/* MARK: - Mutating func
 
 struct StepCounter {
 var steps = 0
 
 mutating func callAsFunction(count: Int) -> Bool {
 steps = count
 print(steps)
 return steps > 10_000
 }
 }
 
 var steps = StepCounter()
 let targetReached = steps.callAsFunction(count: 10)
 print(steps.steps)
 */


/* MARK: - Sync queue
 
 let queue = DispatchQueue(label: "main", qos: .userInteractive)
 queue.sync {
 print(1)
 print(2)
 }
 */


/* MARK: - Block operation
 
 class Execution {
 
 // Managing tasks with OperationQueue
 func executeTaskWithOperation()  {
 
 let t1 = BlockOperation {
 for i in 0...10 {
 print("~~> Task 1 Executing ..", i)
 sleep(1)
 }
 print("Task 1 completed")
 }
 
 let t2 = BlockOperation {
 for i in 0...10 {
 print("==> Task 2 Executing ..", i)
 sleep(1)
 }
 print("Task 2 Completed")
 }
 
 let successBlock = BlockOperation {
 print("Tasks Completed")
 }
 
 let oper = OperationQueue()
 
 t2.addDependency(t1)  // Remove this to see concurrent exec of t1 and t2
 successBlock.addDependency(t2)
 successBlock.addDependency(t1)
 
 oper.addOperations([t2, successBlock, t1], waitUntilFinished: true)
 
 }
 }
 
 let e = Execution()
 e.executeTaskWithOperation()
 */

/* MARK: - LeetCode
 
 var num: [Int] = [2, 7, 11, 15, 5, 5]
 let target: Int = 10
 var result: [Int] = []
 
 for i in num.indices {
 for j in i+1..<num.count {
 if num[i] + num[j] == target {
 result.append(i)
 result.append(j)
 break;
 }
 }
 }
 
 print(result)
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var result: String = ""
    var max = 0
    for char in s {
        result.append(char)
        
    }
    return max
}

lengthOfLongestSubstring("bbbbbb")

