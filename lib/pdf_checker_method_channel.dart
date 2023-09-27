import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pdf_checker_platform_interface.dart';

/// An implementation of [PdfCheckerPlatform] that uses method channels.
class MethodChannelPdfChecker extends PdfCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pdf_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
