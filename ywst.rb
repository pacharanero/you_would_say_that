#!/usr/bin/env ruby
# simple script for you_would_say_that proof of concept
# takes a statement, encrypts it and hashes it. Hash can be published or chained to prove provenance of statement.

#Dependencies
require 'openssl'
require 'encryptor'

#user input
time_start = Time.now
puts "Date/time started: #{time_start}"
print "Enter Statement metadata: "
statement_metadata = gets.chomp
print "Enter Statement text: "
statement_text = gets.chomp
time_end = Time.now
puts "Date/time ended: #{time_end}"
print "Enter password for key generation (longer is better): "
password = gets.chomp

#Encryption
puts "Now encrypting statement with the provided key..."
cipher = OpenSSL::Cipher::AES256.new(:CBC)
cipher.encrypt
salt = "a"
cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(password, salt, 2000, 256) #generate sha256 key from password
iv = cipher.random_iv
cipher.iv = iv
complete_statement = "START: " + time_start.to_s + "META: " + statement_metadata + "TEXT: " + statement_text + "END: " + time_end.to_s
puts complete_statement
encrypted_statement = cipher.update(complete_statement) + cipher.final
puts "Encrypted statement:"
puts encrypted_statement
password = "" #clear stored password
gets

#Digest
puts "SHA256 Hex:" 
sha256 = Digest::SHA256.new
digest = sha256.hexdigest complete_statement
puts digest

#Decryption
puts "Decrypting statement..."
print "Please enter password: "
password = gets.chomp
decipher = OpenSSL::Cipher::AES256.new(:CBC)
decipher.decrypt
decipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(password, salt, 2000, 256)
decipher.iv = iv
plain = decipher.update(encrypted_statement) + decipher.final
puts plain
gets







