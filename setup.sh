export DOCKER_CONTENT_TRUST=1
docker run -d --name dd-agent \
           -v /var/run/docker.sock:/var/run/docker.sock:ro \
           -v /proc/:/host/proc/:ro \
           -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
           -e DD_API_KEY=ccc1cdb5b7f5359f2d559cb8a24e1480 \
           -e DD_SITE="datadoghq.com" \
           -e DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true \
           -p 8125:8125/udp \
           -p 8126:8125/tcp \
           datadog/agent:7


# Verify system status
docker exec -it <CONTAINER_NAME> s6-svstat /var/run/s6/services/agent/

# Agent status
docker exec -it <CONTAINER_NAME> agent status