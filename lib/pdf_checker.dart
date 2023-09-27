import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pdf_checker/models/pdf_info.dart';

import 'pdf_checker_platform_interface.dart';

class PdfChecker {
  static const MethodChannel _channel = MethodChannel('com.ideal/pdf_checker');

  Future<String?> getPlatformVersion() {
    return PdfCheckerPlatform.instance.getPlatformVersion();
  }

  Future<PDFInfo?> checkInfo(Uint8List bytes) async {
    try {
      final result = await _channel.invokeMethod('checkPdfInfo', bytes);
      if (result is String) {
        return errorChecker(result);
      }
      return PDFInfo.fromJson(result);
    } catch (error) {
      if (kDebugMode) {
        print('Error inside checkInfo: ${error.toString()}');
      }
      return errorChecker(error);
    }
  }

  PDFInfo errorChecker(value) {
    PDFInfo data = PDFInfo();
    if (Platform.isAndroid) {
      if (value.toString().contains("Header doesn't contain versioninfo")) {
        data.isCorrupt = true;
      }
    } else if (Platform.isIOS) {
      if (value.toString().contains("corrupt: failed to check pdf")) {
        data.isCorrupt = true;
      }
    }
    return data;
  }
}
