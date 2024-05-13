## End-to-End Encryption (E2EE) using AES

This repository contains Dart code for implementing end-to-end encryption (E2EE) for files using AES (Advanced Encryption Standard).

**Features:**
- **AES Encryption:** Utilizes AES encryption algorithm for secure file encryption.
- **Password Protection:** Files are encrypted and decrypted using a user-defined password for added security.
- **Synchronous Operations:** Encryption and decryption operations are performed synchronously for simplicity.

**Usage:**
1. Import the `aes_crypt_null_safe` and `open_file_plus` packages.
2. Initialize an `AesCrypt` instance, set a password, and use it to encrypt and decrypt files.
3. Open the decrypted file using `OpenFile.open` method.

**Example:**
```dart
String encryptedFile = EncryptData.encrypt_file(filePath);
String decryptedFile = EncryptData.decrypt_file(encryptedFile);
```
Based on the provided code, it seems you're using AES encryption for file encryption and decryption. Here's a description of how this code implements end-to-end encryption (E2EE) and how you can structure it for GitHub:

### Description of E2EE Implementation:

1. **AES Encryption**: The code uses AES encryption to encrypt and decrypt files. AES (Advanced Encryption Standard) is a symmetric encryption algorithm widely used for securing sensitive data.

2. **Encryption Method**: The `encrypt_file` method encrypts a file specified by its path using AES encryption. It initializes an `AesCrypt` instance, sets the password, and then encrypts the file synchronously using `encryptFileSync` method.

3. **Decryption Method**: The `decrypt_file` method decrypts an encrypted file specified by its path. It initializes an `AesCrypt` instance with the same password used for encryption, and then decrypts the file synchronously using `decryptFileSync` method.

4. **File Handling**: After encryption and decryption, the code prints messages indicating the success of the operations and opens the decrypted file using `OpenFile.open` method.

**Note:** Ensure to handle passwords securely and share them securely with intended recipients.