## Create a bucket

aws s3 mb s3://class-fun-ab-6346

## Create a file

echo "Hello world" > hello.txt

aws s3 cp hello.txt s3://class-fun-ab-6346
aws s3 cp hello.txt s3://class-fun-ab-6346 --storage-class STANDARD_IA
