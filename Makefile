build:
 rm -rf public
 hugo

deploy: build
 aws s3 sync public/ s3://hugo-learn --delete
 aws cloudfront create-invalidation --distribution-id E2R0VQXYVGHNOM --paths '/*'