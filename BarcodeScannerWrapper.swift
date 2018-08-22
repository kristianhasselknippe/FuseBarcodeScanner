import UIKit
import BarcodeScanner

@objc public class FuseBarcodeViewController : UIViewController,
                                     BarcodeScannerCodeDelegate,
                                     BarcodeScannerErrorDelegate,
BarcodeScannerDismissalDelegate{
    public func barcodeScanner(_ controller: BarcodeScannerController, didCaptureCode code: String, type: String) {
        print("GOT CODE")
        print(code)
        controller.reset()
    }
    
    public func barcodeScanner(_ controller: BarcodeScannerController, didReceiveError error: Error) {
        print("ERROROOOOR")
        print(error)

    }
    
    public func barcodeScannerDidDismiss(_ controller: BarcodeScannerController) {
        print("Scanner dismissed")
    }

    var viewController: BarcodeScannerController = BarcodeScannerController()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        print("The view was loaded")
        present(self, animated:false, completion: nil)
    }
    
    public func CreateBarcodeScanner() -> UIView {
        self.viewController.codeDelegate = self
        self.viewController.errorDelegate = self
        self.viewController.dismissalDelegate = self
        
        addChildViewController(self.viewController)
        print("The view is being returned")
        return self.view
    }
}
