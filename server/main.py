import os
import pyAesCrypt
import argparse
from concurrent.futures import ThreadPoolExecutor

class EncryptData:
    bufferSize = 64 * 1024

    @staticmethod
    def encrypt_file(path, password):
        enc_file_path = path + ".aes"
        try:
            pyAesCrypt.encryptFile(path, enc_file_path, password, EncryptData.bufferSize)
            print('The encryption has been completed successfully.')
            print(f'Encrypted file: {enc_file_path}')
        except Exception as e:
            print(f'Error: {e}')
            return f'Error: {e}'
        return enc_file_path

    @staticmethod
    def decrypt_file(path, password):
        dec_file_path = path.rstrip(".aes")
        try:
            pyAesCrypt.decryptFile(path, dec_file_path, password, EncryptData.bufferSize)
            print('The decryption has been completed successfully.')
            print(f'Decrypted file: {dec_file_path}')
        except Exception as e:
            print(f'Error: {e}')
            return f'Error: {e}'
        return dec_file_path

def main():
    parser = argparse.ArgumentParser(description="Encrypt or Decrypt files using AES encryption.")
    parser.add_argument('path', type=str, help='The path to the file to encrypt/decrypt.')
    parser.add_argument('password', type=str, help='The password for encryption/decryption.')
    parser.add_argument('--decrypt', action='store_true', help='Flag to indicate decryption instead of encryption.')

    args = parser.parse_args()

    path = args.path
    password = args.password

    with ThreadPoolExecutor() as executor:
        if args.decrypt:
            future_decrypt = executor.submit(EncryptData.decrypt_file, path, password)
            decrypted_path = future_decrypt.result()
            print(f'Decrypted file path: {decrypted_path}')
        else:
            future_encrypt = executor.submit(EncryptData.encrypt_file, path, password)
            encrypted_path = future_encrypt.result()
            print(f'Encrypted file path: {encrypted_path}')

if __name__ == "__main__":
    main()
