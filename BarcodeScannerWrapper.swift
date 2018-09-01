import UIKit
import BarcodeScanner

@objc public class FuseBarcodeView : NSObject,
                                     BarcodeScannerCodeDelegate,
                                     BarcodeScannerErrorDelegate,
                                     BarcodeScannerDismissalDelegate {

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

    var barcodeVC: BarcodeScannerController = BarcodeScannerController()


    public func getView() -> UIView {
        self.barcodeVC.codeDelegate = self
        self.barcodeVC.errorDelegate = self
        self.barcodeVC.dismissalDelegate = self

        barcodeVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        return barcodeVC.view
    }
}
