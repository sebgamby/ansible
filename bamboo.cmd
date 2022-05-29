docker volume create bamboo-data
docker network create bamboo
docker run --name bamboo-server --restart=on-failure --detach --network bamboo --network-alias bamboo-server --volume bamboo-data:/var/atlassian/application-data/bamboo --publish 8085:8085 --publish 54663:54663 atlassian/bamboo
docker build -t bamboo-agent:0.1 -f .\bambooAgent.Dockerfile . 
docker run -e BAMBOO_SERVER=http://bamboo-server:8085/agentServer/ -v bamboo-agent-data:/var/atlassian --name bamboo-agent --restart=on-failure --detach --privileged --network bamboo --network-alias bamboo-agent -d bamboo-agent:0.2