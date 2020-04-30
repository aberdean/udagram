aws cloudformation create-stack \
    --stack-name udagram-init \
    --template-body file://init.yml \
    --parameters file://init-params.json \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
    --region=us-west-2

echo "Waiting for stack creation to complete ..."

aws cloudformation wait stack-create-complete \
    --region us-west-2 \
    --stack-name udagram-init

echo "Stack created successfully."
echo "Uploading file to S3 bucket ..."

aws s3 cp index.zip s3://udagram-s3bucket

sleep 10

echo "Done!"
