require 'aws-sdk-s3'
require 'openssl'
key = OpenSSL::PKey::RSA.new(1024)

bucket ='encrypt-client-fun-ab-1243'

# encryption client
s3 = Aws::S3::EncryptionV2::Client.new(
    encryption_key: key,
    key_wrap_schema: :rsa_oaep_sha1,
    contet_encryption_schema: :aes_gcm_no_padding,
    security_profile: :v2
    )

# round-trip an object, encrypted/decrypted locally
resp = s3.put_object(bucket: bucket, key: 'hello.txt', body:'handshake')
binding.pry
puts "PUT"
puts resp
resp = s3.get_object(bucket: bucket, key: 'hello.txt').body.read
puts "GET WITH KEY"
puts resp
#=> 'handshake'

# reading encrypted object without the encryption client
# results in the getting the cipher text
Aws::S3::Client.new.get_object(bucket:bucket, key:'hello.txt').body.read
puts "GET WITHOUT KEY"
puts resp