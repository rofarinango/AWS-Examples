### Create a bucket

aws s3 mb s3://bucket-policy-example-ab-5235

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket bucket-policy-example-ab5235 --policy file:://policy.json
```

## In the other account access the bucket

```sh
touch bootcamp.txt
aws s3 cp bootcamp.txt s3://bucket-policy-example-ab-5235
aws s3 ls s3://bucket-policy-example-ab-5235
```

## Cleanup 

```sh
aws s3 rm s3://acl-example-ab5235/bootcamp.txt
aws s3 rb s3://acl-example-ab5235
```