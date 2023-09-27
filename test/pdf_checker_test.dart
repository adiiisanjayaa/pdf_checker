import 'package:flutter_test/flutter_test.dart';
import 'package:pdf_checker/pdf_checker.dart';
import 'package:pdf_checker/pdf_checker_method_channel.dart';
import 'package:pdf_checker/pdf_checker_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPdfCheckerPlatform with MockPlatformInterfaceMixin implements PdfCheckerPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PdfCheckerPlatform initialPlatform = PdfCheckerPlatform.instance;

  test('$MethodChannelPdfChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPdfChecker>());
  });

  test('getPlatformVersion', () async {
    PdfChecker pdfChecker = PdfChecker();
    MockPdfCheckerPlatform fakePlatform = MockPdfCheckerPlatform();
    PdfCheckerPlatform.instance = fakePlatform;

    expect(await pdfChecker.getPlatformVersion(), '42');
  });
}
