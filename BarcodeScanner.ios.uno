using Uno;
using Uno.UX;
using Uno.Compiler.ExportTargetInterop;
using Fuse.Controls.Native;

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
    extern(iOS) public class BarcodeScannerControl: ViewHandle, IBarcodeScanner
    {
        [UXConstructor]
        public BarcodeScannerControl([UXParameter("Host")]IBarcodeScannerHost host) :
            this(host, CreateView()) { }

        readonly ObjC.Object _view;

        BarcodeScannerControl(IBarcodeScannerHost host, ObjC.Object view) :
            base(view)
        {
            _view = view;
        }

        [Foreign(Language.ObjC)]
        static ObjC.Object CreateView()
        @{
            FuseBarcodeView* vc = [[FuseBarcodeView alloc] init];
            return [vc getView];
        @}
    }
}
