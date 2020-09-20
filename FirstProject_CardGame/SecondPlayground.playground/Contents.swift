import UIKit

var str = "Hello, playground"

func sayHello() -> Void {
    
    print("Hello!")
    
}

sayHello()

// the `- ` before the parameter name means that you don't have
// to use the parameter names in the function call
func seyHelloTo(_ name:String, _ age:Int) -> Void {
    
        print("Hello \(name), you are \(age) years old")
    
}

// if not for the `- ` in the function declaration, the function
// call would be written like:
// seyHelloTo(name: "Daniel", age: 29)
seyHelloTo("Daniel",29)

func addFourTo(x:Int) -> Int {
    
    let sum = x + 4
    
    return sum
}

var result = addFourTo(x: 10)
print(result)
