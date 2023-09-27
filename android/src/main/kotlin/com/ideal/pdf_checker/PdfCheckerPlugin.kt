package com.ideal.pdf_checker

import android.content.Context
import android.graphics.pdf.PdfDocument
import androidx.annotation.NonNull
import com.tom_roush.pdfbox.android.PDFBoxResourceLoader
import com.tom_roush.pdfbox.pdmodel.PDDocument
import com.tom_roush.pdfbox.pdmodel.encryption.InvalidPasswordException

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** PdfCheckerPlugin */
class PdfCheckerPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private lateinit var context: Context


  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.ideal/pdf_checker")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
    PDFBoxResourceLoader.init(context)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if(call.method == "checkPdfInfo"){
      try {
        val bytes: ByteArray? = call.arguments()
        val pdDocument = PDDocument.load(bytes)

        result.success(listOf(
          pdDocument. isEncrypted,
          pdDocument.currentAccessPermission.canPrint(),
          pdDocument.currentAccessPermission.canAssembleDocument(),
          pdDocument.currentAccessPermission.canModify(),
          pdDocument.currentAccessPermission.canFillInForm(),
          pdDocument.currentAccessPermission.canExtractForAccessibility(),
          pdDocument.currentAccessPermission.canExtractContent(),//copy
//        pdDocument.currentAccessPermission.canModifyAnnotations(),
        ))
      } catch (e: java.lang.Exception) {
        result.success(e.toString())
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
