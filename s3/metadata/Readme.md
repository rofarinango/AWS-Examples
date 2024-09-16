## Create bucket

aws s3 mb s3://metadata-fun-ab-12421

### Create a new file

echo "Hellow Mars." > hello.txt

## Upload file with metadata

aws s3api put-object --bucket metadata-fun-ab-12421 --key hello.txt --body hello.txt --metadata Planet=Mars

## Get Metadata through head object

aws s3api put-object --bucket metadata-fun-ab-12421 --key hello.txt