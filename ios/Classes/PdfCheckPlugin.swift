import Flutter
import UIKit
import PDFKit

public class PdfCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.ideal/pdf_checker", binaryMessenger: registrar.messenger())
    let instance = PdfCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      
    guard let flutterData = call.arguments as? FlutterStandardTypedData else {
        result([])
        return
    }
      
    if let pdfDocument = PDFDocument(data: flutterData.data) {
        let res : [Any] = [
            ["allowsCopying":pdfDocument.allowsCopying],
            ["allowsPrinting":pdfDocument.allowsPrinting],
            ["allowsCommenting":pdfDocument.allowsCommenting],
            ["allowsDocumentChanges":pdfDocument.allowsDocumentChanges],
            ["allowsDocumentAssembly":pdfDocument.allowsDocumentAssembly],
            ["allowsContentAccessibility":pdfDocument.allowsContentAccessibility],
            ["allowsFormFieldEntry":pdfDocument.allowsFormFieldEntry],
            ["isEncrypted":pdfDocument.isEncrypted],
            ["isLocked":pdfDocument.isLocked],
        ]
        result(res)
    }
      result("corrupt: failed to check pdf")
  }
}
