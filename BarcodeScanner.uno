using Uno;
using Uno.UX;
using Uno.Compiler.ExportTargetInterop;
using Fuse.Controls;

namespace Barcode
{

    public interface IBarcodeScannerHost
    {
        void OnFoundBarcode(string value);
    }

    public interface IBarcodeScanner
    {

    }

    public class MyBarcodeScanner : Control, IBarcodeScannerHost
    {
        public void OnFoundBarcode(string value)
        {

        }

        void IBarcodeScannerHost.OnFoundBarcode(string newValue)
        {
        }

        IBarcodeScanner NativeBarcodeScanner
        {
            get { return NativeView as IBarcodeScanner; }
        }
    }
}
