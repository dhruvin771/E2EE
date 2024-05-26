import 'dart:io';

import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file_plus/open_file_plus.dart';

class EncryptData {
  static Future<String> encryptFile(String path) async {
    return await compute(_encryptFile, path);
  }

  static String _encryptFile(String path) {
    AesCrypt crypt = AesCrypt();
    crypt.setOverwriteMode(AesCryptOwMode.on);
    crypt.setPassword('my cool password');
    String encFilepath;
    try {
      encFilepath = crypt.encryptFileSync(path);
      print('The encryption has been completed successfully.');
      print('Encrypted file: $encFilepath');
      _decryptFile(encFilepath);
    } catch (e) {
      print(e);
      return 'Error: $e';
    }
    return encFilepath;
  }

  static Future<String> decryptFile(String path) async {
    return await compute(_decryptFile, path);
  }

  static String _decryptFile(String path) {
    AesCrypt crypt = AesCrypt();
    crypt.setOverwriteMode(AesCryptOwMode.on);
    crypt.setPassword('my cool password');
    String decFilepath;
    try {
      decFilepath = crypt.decryptFileSync(path);
      print('The decryption has been completed successfully.');
      print('Decrypted file: $decFilepath');
      print('File content: ${File(decFilepath).path}');
      OpenFile.open(File(decFilepath).path);
    } catch (e) {
      print(e);
      return 'Error: $e';
    }
    return decFilepath;
  }
}
