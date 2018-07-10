set -e

echo "Getting list of containers..."
CONTAINERS=$(docker ps -aq)

if [ -z "$CONTAINERS" ]; then
    echo "No containers found to delete."
else
    echo "Stopping all containers..."
    docker stop $CONTAINERS

    echo "Deleting all containers..."
    docker rm $CONTAINERS
fi

echo "Getting list of images..."
IMAGES=$(docker images -q)

if [ -z "$IMAGES" ]; then
    echo "No images found to delete."
else
    echo "Deleting all images..."
    docker rmi $IMAGES
fi

say "Nuked"
echo "Done"

