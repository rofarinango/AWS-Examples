## Create a bucket

aws s3 mb s3://encrypt-client-fun-ab-1243

## Create a file
echo "Hello world" > hello.txt


bundle exec ruby encrypt.rb

## Cleanup

aws s3 rm s3://encrypt-client-fun-ab-1243/hello.txt
aws s3 rb s3://encrypt-client-fun-ab-1243