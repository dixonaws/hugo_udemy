 build:
	rm -Rvf public/
	hugo

deploy: build
	aws s3 sync public/ s3://hugo-learn --acl public-read --delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E2R0VQXYVGHNOM --paths '/*'