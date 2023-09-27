import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pdf_checker_method_channel.dart';

abstract class PdfCheckerPlatform extends PlatformInterface {
  /// Constructs a PdfCheckerPlatform.
  PdfCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static PdfCheckerPlatform _instance = MethodChannelPdfChecker();

  /// The default instance of [PdfCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelPdfChecker].
  static PdfCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PdfCheckerPlatform] when
  /// they register themselves.
  static set instance(PdfCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
