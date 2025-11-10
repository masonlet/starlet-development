STARLET_DIR=starlet
USER=masonlet
test_repo=${1:-starlet-samples}

repos=(
  ${USER}/starlet-math 
  ${USER}/starlet-logger
  ${USER}/starlet-controls 
  ${USER}/starlet-scene 
  ${USER}/starlet-graphics 
  ${USER}/starlet-serializer
  ${USER}/starlet-engine 
  ${USER}/${test_repo}
)

mkdir -p ${STARLET_DIR}
cd ${STARLET_DIR} || exit 1

echo "Cloning repositories"
echo ""
for repo in "${repos[@]}"; do
  repo_name=${repo#*/}
  if [ ! -d "${repo_name}" ]; then
    echo "Cloning ${repo}"
    git clone https://github.com/${repo}.git || {
      echo "Failed to clone ${repo}"
      exit 1
    }
  else
    echo "$repo already exists!"
  fi
  echo ""
done

echo "Finished cloning, building.."
cd ..
mkdir -p build
cd build || exit 1

cmake -DBUILD_LOCAL=ON -DTEST_REPO=${test_repo} .. || {
  echo "CMake configuration failed"
  exit 1
}

echo ""
echo "Building project..."
cmake --build . || {
  echo "Build failed"
  exit 1
}

echo ""
echo "Build complete!"
sleep 5