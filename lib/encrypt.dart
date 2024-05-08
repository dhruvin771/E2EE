import 'dart:io';

import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';

class EncryptData {
  static String encrypt_file(String path) {
    AesCrypt crypt = AesCrypt();
    crypt.setOverwriteMode(AesCryptOwMode.on);
    crypt.setPassword('my cool password');
    String encFilepath;
    try {
      encFilepath = crypt.encryptFileSync(path);
      print('The encryption has been completed successfully.');
      print('Encrypted file: $encFilepath');
      decrypt_file(encFilepath);
    } catch (e) {
      /* if (e.type == AesCryptExceptionType.destFileExists) {
        print('The encryption has been completed unsuccessfully.');
        print(e.message);
      }
      else{
        return 'ERROR';
      }*/
    }
    return "encFilepath";
  }

  static String decrypt_file(String path) {
    AesCrypt crypt = AesCrypt();
    crypt.setOverwriteMode(AesCryptOwMode.on);
    crypt.setPassword('my cool password');
    String decFilepath;
    try {
      decFilepath = crypt.decryptFileSync(path);
      print('The decryption has been completed successfully.');
      print('Decrypted file 1: $decFilepath');
      print('File content: ' + File(decFilepath).path);
    } catch (e) {
      /*if (e.type == AesCryptExceptionType.destFileExists) {
        print('The decryption has been completed unsuccessfully.');
        print(e.message);
      }
      else{
        return 'ERROR';
      }*/
      print("e");
    }
    return "0";
  }
}
