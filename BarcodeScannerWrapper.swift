import UIKit
import BarcodeScanner

@objc public class FuseBarcodeView : UIView,
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

    public override var frame: CGRect {
        get {
            print("The bounds:")
            print(self.barcodeVC.view.bounds)
            print("The frame")
            print(self.barcodeVC.view.frame)
            return self.barcodeVC.view.bounds
        }
        set {
            print("Foobar")
            print(newValue)
            return self.barcodeVC.view.bounds = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.barcodeVC.codeDelegate = self
        self.barcodeVC.errorDelegate = self
        self.barcodeVC.dismissalDelegate = self

        self.barcodeVC.view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleTopMargin.rawValue)))
        
        addSubview(barcodeVC.view)
    }

    public convenience init() {
        self.init(frame: CGRect.zero)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
