### ShenghuiChen/docker-mcrouter
This is a an ubuntu 18.04 (bionic) based Docker image for Mcrouter. It uses/installs the facebook tracked bionic deb for mcrouter

### Usage

#### Memcached
docker run --name memcached0 -d -p 12000:12000  sylvainlasnier/memcached
docker run --name memcached1 -d -p 12000:12000 sylvainlasnier/memcached

##### Replicated pools mcrouter(多副本集群)
docker run -d -p 6004:6004 --restart=always --name=gameinfo   chenshenghui/mcrouterv40.0.0    mcrouter --config-str='{"pools": {"A": {"servers": ["192.168.56.68:12000","192.168.56.69:12000"]}},"route": {"type": "OperationSelectorRoute","operation_policies": {"add": "AllSyncRoute|Pool|A","delete": "AllSyncRoute|Pool|A","get": "LatestRoute|Pool|A","set": "AllSyncRoute|Pool|A"}}}' -p 6004

