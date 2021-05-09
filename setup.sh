docker-compose up -d
docker exec -it mongo1 sh -c "mongo --port 30001"
docker exec -it mongo2 sh -c "mongo --port 30002"
docker exec -it mongo3 sh -c "mongo --port 30003"

rs.initiate({_id : 'my-replica-set',members: [{ _id : 0, host : "mongo1:30001" },{ _id : 1, host : "mongo2:30002" },{ _id : 2, host : "mongo3:30003" }]});
rs.status();
