import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

import 'fast_rsa/fast_rsa.dart';

class RSAKeyGenerator {
  static Future<KeyPair> generateKeyPair({int keySize = 2048}) async {
    try {
      KeyPair keyPair = await FRSA.generate(keySize);
      return keyPair;
    } catch (e) {
      print('Error generating RSA key pair: $e');
      rethrow;
    }
  }

  static Future<String> convertJWKToPrivateKey(
      String data, String keyId) async {
    try {
      String privateKey = await FRSA.convertJWKToPrivateKey(data, keyId);
      return privateKey;
    } catch (e) {
      print('Error converting JWK to private key: $e');
      rethrow;
    }
  }

  static Future<String> convertJWKToPublicKey(String data, String keyId) async {
    try {
      String publicKey = await FRSA.convertJWKToPublicKey(data, keyId);
      return publicKey;
    } catch (e) {
      print('Error converting JWK to public key: $e');
      rethrow;
    }
  }

  static Future<Encrypter> encryptMessageWithPublicKey(
      String message, String publicKey, String privateKey) async {
    try {
      RSAKeyParser parser = RSAKeyParser();
      RSAPublicKey pbk = parser.parse(publicKey) as RSAPublicKey;
      RSAPrivateKey pk = parser.parse(publicKey) as RSAPrivateKey;

      final encrypter = Encrypter(RSA(publicKey: pbk, privateKey: pk));
      final encrypted = encrypter.encrypt(message);

      print('Encrypted Message: $encrypted');

      return encrypter;
    } catch (e) {
      print('Error encrypting message with public key: $e');
      rethrow;
    }
  }
}
