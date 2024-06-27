cp ../UTN-FRA_SO_Examenes/202406 .
cp -r ../UTN-FRA_SO_Examenes/202406 .
mv  ../RTA_Examen_20240627/ .
ls
cd 202406/docker/
v index.html
v Dockerfile
v run.sh
docker login
chmod +x run.sh
docker build -t web1-plastina
docker build -t web1-plastina .
lsblk
du -h -d 1 /
sudo du -h -d 1 /
docker build -t web1-plastina .
docker tag web1-plastina federico94/web1-plastina
docker push federico94/web1-plastina
./run.sh
./run.sh

