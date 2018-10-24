$REGISTRY="registry.hub.docker.com"
$IMAGE_NAME="dukeluke16/vs15-build"
$TAG=$args[0]

Write-Output "${REGISTRY}/${IMAGE_NAME}:${TAG}"

docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} -t ${REGISTRY}/${IMAGE_NAME}:latest -t ${IMAGE_NAME}:${TAG} -t ${IMAGE_NAME}:latest -m 4GB .
#docker push ${REGISTRY}/${IMAGE_NAME}
