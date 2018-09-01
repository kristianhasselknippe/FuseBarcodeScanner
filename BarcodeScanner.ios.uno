using Uno;
using Uno.UX;
using Uno.Compiler.ExportTargetInterop;

using Fuse.Controls.Native.iOS;


namespace Barcode.iOS
{
    extern (!iOS) public class BarcodeScannerControl
    {
        [UXConstructor]
        public BarcodeScannerControl([UXParameter("Host")]IBarcodeScannerHost host) { }
    }

    [Require("Source.Include", "UIKit/UIKit.h")]
    [ForeignInclude(Language.ObjC, "@(Project.Name)-Swift.h")]
    [Require("Cocoapods.Podfile.Target", "pod 'BarcodeScanner'")]
    extern(iOS) public class BarcodeScannerControl: LeafView, IBarcodeScanner
    {
        [UXConstructor]
        public BarcodeScannerControl([UXParameter("Host")]IBarcodeScannerHost host) : base(Create()) { }

        [Foreign(Language.ObjC)]
        static ObjC.Object Create()
        @{
            return [[FuseBarcodeView alloc] init];
        @}

        void OnFoundBarcode()
        {
            // TODO: implement value changed callback
        }
    }
}
