import 'dart:io';

import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';
import 'package:flutter/foundation.dart';
import 'package:open_file_plus/open_file_plus.dart';

class EncryptData {
  static Future<String> encryptFile(String path, String password) async {
    return await compute(_encryptFile, {'path': path, 'password': password});
  }

  static String _encryptFile(Map<String, String> params) {
    AesCrypt crypt = AesCrypt();
    crypt.setOverwriteMode(AesCryptOwMode.on);
    crypt.setPassword(params['password']!);
    String encFilepath;
    try {
      encFilepath = crypt.encryptFileSync(params['path']!);
      print('The encryption has been completed successfully.');
      print('Encrypted file: $encFilepath');
    } catch (e) {
      print(e);
      return 'Error: $e';
    }
    return encFilepath;
  }

  static Future<String> decryptFile(String path, String password) async {
    return await compute(_decryptFile, {'path': path, 'password': password});
  }

  static String _decryptFile(Map<String, String> params) {
    AesCrypt crypt = AesCrypt();
    crypt.setOverwriteMode(AesCryptOwMode.on);
    crypt.setPassword(params['password']!);
    String decFilepath;
    try {
      decFilepath = crypt.decryptFileSync(params['path']!);
      print('The decryption has been completed successfully.');
      print('Decrypted file: $decFilepath');
      OpenFile.open(File(decFilepath).path);
    } catch (e) {
      print(e);
      return 'Error: $e';
    }
    return decFilepath;
  }
}
