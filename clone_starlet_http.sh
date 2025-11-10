mkdir -p starlet
cd starlet || exit

user=masonlet
test_repo=${1:-starlet-samples}

repos=(
  ${user}/starlet-math 
  ${user}/starlet-logger
  ${user}/starlet-controls 
  ${user}/starlet-scene 
  ${user}/starlet-graphics 
  ${user}/starlet-serializer
  ${user}/starlet-engine 
  ${user}/${test_repo}
)

for repo in "${repos[@]}"; do
  if [ ! -d "$repo" ]; then
    git clone https://github.com/$repo.git
  else
    echo "$repo already exists!"
  fi
  echo ""
done

echo "Finished cloning, building.."
cd ..

mkdir -p build
cd build || exit
cmake -DBUILD_LOCAL=ON -DTEST_REPO=${test_repo} ..

echo "Finished building, closing.."
sleep 5