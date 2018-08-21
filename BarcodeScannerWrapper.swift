import UIKit
import BarcodeScanner

@objc public class HelloSwiftWorld : NSViewController {
    public func CreateBarcodeScanner() -> BarcodeScannerController{
        print("Hello world foooooooooo!");
        let viewController = BarcodeScannerController()
        viewController.codeDelegate = self
        viewController.errorDelegate = self
        viewController.dismissalDelegate = self
        return viewController
    }
}
