````markdown
# PDF Checker Package for Flutter

The PDF Checker package for Flutter allows you to easily check and extract information from PDF documents within your Flutter applications. It simplifies common PDF-related tasks and provides a straightforward API for working with PDF files.

## Features

- [x] Get allowsCopying
- [x] Get allowsPrinting
- [x] Get allowsDocumentChanges
- [x] Get allowsDocumentAssembly
- [x] Get allowsContentAccessibility
- [x] Get allowsFormFieldEntry
- [x] Get isEncrypted
- [x] Get isCorrupt

## Installation

To use this package, add `pdf_checker` as a [dependency in your `pubspec.yaml` file]

```yaml
dependencies:
  pdf_checker: ^latest_version
```
````

Then, run `flutter pub get` to install the package.

## Usage

### Import the package

```dart
import 'package:pdf_checker/pdf_checker.dart';
```

### Extract the PDF info

```dart
PdfChecker checker = PdfChecker();
final checkerResult = await checker.checkInfo(file.readAsBytesSync());
print('allowsCopying : ${checkerResult?.allowsCopying}'); // true or false
```

For more detailed documentation and examples, refer to the [API documentation](https://pub.dev/packages/pdf_checker).

## License

This package is licensed under the [MIT License](LICENSE), which means you are free to use, modify, and distribute it in your projects.

## Issues and Feedback

If you encounter any issues or have feedback, please feel free to [open an issue on GitHub](https://github.com/ideal/pdf_checker/issues). We welcome your contributions and suggestions!
