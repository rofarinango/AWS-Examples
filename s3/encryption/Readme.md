## Create a bucket

aws s3 mb s3://encryption-fun-ab-135

### Create a file

echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://encryption-fun-ab-135

### Put object with encryption of KMS

aws s3api put-object \
--bucket encryption-fun-ab-135 \
--key hello.txt \
--body hello.txt \
--server-side-encryption aws:kms \
--ssekms-key-id [YOUR-KMS-KEY]

### Put Object with SSE-C

export BASE64_ENCODED_KEY=$(openssl rand -base64 32)

echo $BASE64_ENCODED_KEY

export MD5_VALUE=$(echo -n $BASE64_ENCODED_KEY | base 64 --decode | md5sum | awk '{print $1}' | base64)

echo $MD5_VALUE

aws s3api put-object \
--bucket encryption-fun-ab-135 \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES-256 \
--sse-customer-key $BASE64_ENCODED_KEY \
--sse-customer-key-md5 $MD5_VALUE