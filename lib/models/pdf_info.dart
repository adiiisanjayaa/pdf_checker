import 'dart:io';

class PDFInfo {
  bool? allowsCopying;
  // bool? allowsCommenting;
  bool? allowsPrinting;
  bool? allowsDocumentChanges;
  bool? allowsDocumentAssembly;
  bool? allowsContentAccessibility;
  bool? allowsFormFieldEntry;
  bool? isEncrypted;
  bool? isCorrupt;
  // bool? isLocked;

  PDFInfo({
    this.allowsCopying,
    // this.allowsCommenting,
    this.allowsDocumentChanges,
    this.allowsDocumentAssembly,
    this.allowsContentAccessibility,
    this.allowsFormFieldEntry,
    this.isEncrypted,
    this.allowsPrinting,
    this.isCorrupt,
    // this.isLocked
  });

  PDFInfo.fromJson(json) {
    if (Platform.isIOS) {
      isEncrypted = json[7]['isEncrypted'];
      allowsPrinting = json[1]['allowsPrinting'];
      allowsDocumentAssembly = json[4]['allowsDocumentAssembly'];
      allowsDocumentChanges = json[3]['allowsDocumentChanges'];
      allowsFormFieldEntry = json[6]['allowsFormFieldEntry'];
      allowsContentAccessibility = json[5]['allowsContentAccessibility'];
      allowsCopying = json[0]['allowsCopying'];
      isCorrupt = false;
      // allowsCommenting = json[2]['allowsCommenting'];
      // isLocked = json[8]['isLocked'];
    } else if (Platform.isAndroid) {
      isEncrypted = json[0];
      allowsPrinting = json[1];
      allowsDocumentAssembly = json[2];
      allowsDocumentChanges = json[3];
      allowsFormFieldEntry = json[4];
      allowsContentAccessibility = json[5];
      allowsCopying = json[6];
      isCorrupt = false;
    }
  }
}
