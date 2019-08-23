import UIKit

extension UIColor {
    convenience init? (hexString: String) {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.punctuationCharacters)
        let filteredStr = hexString.filter{"aAbBcCdDeEfF0123456789".contains($0)}

        guard hexString.count == filteredStr.count, hexString.count == 6 else {
            return nil
        }

        let positionR = hexString.index(hexString.startIndex, offsetBy: 2)
        let positionG = hexString.index(hexString.startIndex, offsetBy: 4)

        guard let r = Double("0x" + hexString[..<positionR]),
            let g = Double("0x" + hexString[positionR..<positionG]),
            let b = Double("0x" + hexString[positionG...]) else { return nil }

        self.init(red:   CGFloat(r / 255),
                  green: CGFloat(g / 255),
                  blue:  CGFloat(b / 255),
                  alpha: 1)
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return (r,g,b,a)
        }
        return (0, 0, 0, 0)
    }

    // hue, saturation, brightness and alpha components from UIColor**
    var hsba: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return (hue, saturation, brightness, alpha)
        }
        return (0,0,0,0)
    }

    var htmlRGB: String {
        return String(format: "#%02x%02x%02x", Int(rgba.red * 255), Int(rgba.green * 255), Int(rgba.blue * 255))
    }

    var htmlRGBA: String {
        return String(format: "#%02x%02x%02x%02x", Int(rgba.red * 255), Int(rgba.green * 255), Int(rgba.blue * 255), Int(rgba.alpha * 255) )
    }
}

extension UIColor {
    // Black
    static let lightBlack = UIColor(hexString: "434343")!
    // Gray
    static let stone     = UIColor(hexString: "868f96")!
    static let cloudy    = UIColor(hexString: "d7d2cc")!
    static let fog       = UIColor(hexString: "ebedee")!
    // Purple
    static let indigo    = UIColor(hexString: "3f5efb")!
    static let plum      = UIColor(hexString: "5c258d")!
    static let amethyst  = UIColor(hexString: "9d50bb")!
    static let violet    = UIColor(hexString: "3B0066")!
    // Blue
    static let bluejay   = UIColor(hexString: "00d2ff")!
    static let blueberry = UIColor(hexString: "3a7bd5")!
    static let ocean     = UIColor(hexString: "219DFF")!
    static let lightBlue = UIColor(hexString: "c7eafd")!
    static let seafoam   = UIColor(hexString: "00ecbc")!
    // Green
    static let clover    = UIColor(hexString: "0f9b0f")!
    static let grass     = UIColor(hexString: "a8e063")!
    static let lime      = UIColor(hexString: "24fe41")!
    static let limerick  = UIColor(hexString: "a2c115")!
    static let spring    = UIColor(hexString: "0fd850")!
    static let kindaGreen = UIColor(hexString: "50cc7f")!
    // Yellow
    static let gold      = UIColor(hexString: "D4AF37")!
    static let lemon     = UIColor(hexString: "f9f047")!
    static let marigold  = UIColor(hexString: "F6AE2D")!
    static let mustard  = UIColor(hexString: "F5DE45")!
    // Orange
    static let tangerine = UIColor(hexString: "fe8c00")!
    static let lightOrange = UIColor(hexString: "f6d365")!
    static let sunrise = UIColor(hexString: "fc4a1a")!
    static let bloodOrange = UIColor(hexString: "f00000")!
    // Red
    static let tomato    = UIColor(hexString: "f83600")!
    static let fullRed   = UIColor(hexString: "ff0000")!
    static let lightRed  = UIColor(hexString: "eb5757")!
    static let bloodRed  = UIColor(hexString: "#870000")!
    // Pink
    static let pink      = UIColor(hexString: "ec77ab")!
    static let lightPink = UIColor(hexString: "f4c4f3")!
    static let candy     = UIColor(hexString: "e5b2ca")!
}

extension CGColor {
    static let blacks  = [UIColor.black.cgColor, UIColor.lightBlack.cgColor]
    static let whites  = [UIColor.fog.cgColor, UIColor.white.cgColor]
    static let grays   = [UIColor.stone.cgColor, UIColor.cloudy.cgColor]
    static let reds    = [UIColor.bloodRed.cgColor, UIColor.tomato.cgColor]
    static let oranges = [UIColor.bloodOrange.cgColor, UIColor.tangerine.cgColor]
    static let blues   = [UIColor.blueberry.cgColor, UIColor.bluejay.cgColor]
    static let greens  = [UIColor.clover.cgColor, UIColor.limerick.cgColor]
    static let golds   = [UIColor.marigold.cgColor, UIColor.mustard.cgColor]
    static let purples = [UIColor.violet.cgColor, UIColor.amethyst.cgColor]
}
