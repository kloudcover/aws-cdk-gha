# aws-cdk-gha
A CDK github action

```
docker run --rm -it \
  -v ~/.aws:/root/.aws \
  -v ${PWD}/infra:/github/workspace \
  --entrypoint "" \
  ghcr.io/kloudcover/aws-cdk-gha:latest \
  sh

  ```
