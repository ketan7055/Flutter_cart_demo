import 'package:encrypt/encrypt.dart';

class EncryptData {
//for AES Algorithms

  // static Encrypted? encrypted;

  static encryptAES(plainText) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    print('enc: ' + encrypted!.base64);
    return encrypted!.base64;
  }

  static decryptAES(plainText) {
    final key = Key.fromUtf8('my 32 length key................');
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt(Encrypted.from64(plainText), iv: iv);
    print('dec: ' + decrypted);
    return decrypted;
  }
}
