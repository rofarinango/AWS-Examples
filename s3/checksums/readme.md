## Create a new S3 bucket

```md
aws s3 mb s3://checksums-examples-ab-2342
```

## Create a file that will we do a checksum on

```
echo "Hello Mars" > myfile.txt
```

## Get a checksum of a file for md5

md5sum myfile.txt

## Upload our file to S3 and look at its etag

```
aws s3 cp myfile.txt s3://checksums-examples-ab-2342
aws s3api head-object --bucket checksums-examples-ab-2342 --key myfile.txt
```

## Lets upload a file with a different kind of checksum

```sh
sudo apt-get install rhash -y
rhash --crc32 myfile.txt
```


```sh
aws s3api put-object \
--bucket="checksums-examples-ab-2342" \
--key="myfilesha-1.txt" \
--body="myfile.txt" \
--checksum-alogrithm="SHA-1" \
--checksum-sha1="e7c80b87"
```