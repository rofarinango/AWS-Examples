## Create Website 1

## Create a bucket
```sh
aws s3 mb s3://cors-fun-ab-36252
```
## Change block public access
```sh
aws s3api put-public-access-block \
--bucket cors-fun-ab-36252 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-fun-ab-36252 --policy file://bucket-policy.json
```
## Turn on Static Website hosting
```sh
aws s3api put-bucket-website --bucket cors-fun-ab-36252 --website-configuration file://website.json
```
## Upload our index.html file and include a resource that would be cross-origin
```sh
aws s3 cp index.html s3://cors-fun-ab-36252
```

## Get the website endpoint for S3

It will be this for ca-central-1
http://cors-fun-ab-36252.s3-website.ca-central-1.amazonaws.com

Other regions might use a hyphen instead
http://cors-fun-ab-36252.s3-website-ca-central-1.amazonaws.com

## Create website 2
```sh
aws s3 mb s3://cors-fun2-ab-36252
```
## Change block public access
```sh
aws s3api put-public-access-block \
--bucket cors-fun2-ab-36252 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-fun2-ab-36252 --policy file://bucket-policy2.json
```
## Turn on Static Website hosting
```sh
aws s3api put-bucket-website --bucket cors-fun2-ab-36252 --website-configuration file://website.json
```
## Upload our index.html file and include a resource that would be cross-origin
```sh
aws s3 cp index.html s3://cors-fun2-ab-36252
```

## Set CORS on our bucket

```sh
aws s3api put-bucket-cors --bucket cors-fun-ab-36252 --cors-configuration file://cors.json
```