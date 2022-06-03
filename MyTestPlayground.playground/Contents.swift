import UIKit

var arrayForTest = [["something","never","6"],["one" ,"more","2"]]
let newArray = arrayForTest.sorted { $0[2] < $1[2]}
print(newArray)

let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .short
dateFormatter.timeStyle = .none
//dateFormatter.dateFormat = "dd-MM-yyyy"

let date = NSDate()

print(dateFormatter.string(from: date as Date))

var testNum = 7.9092

//testNum.round()

round(testNum*100)/100




