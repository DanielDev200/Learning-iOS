import UIKit

class SpaceShip {
    
    var fuelLevel = 100
    var name = ""
    
    func cruise() {
        print("Cruising is initiated for \(name)")
    }

    func thrust() {
        print("Rocket thrusters initiated for \(name)")
    }
}

var myShip:SpaceShip = SpaceShip()
myShip.name = "DICKFACE"
myShip.thrust()
myShip.cruise()

print(myShip.name)
print(myShip.fuelLevel)
