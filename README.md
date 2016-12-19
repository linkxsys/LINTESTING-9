# LINTESTING-9

git clone https://github.com/linkxsys/LINTESTING-9.git
cd LINTESTING-9
docker build -t linxsys/nginx:1.0 .
docker run -it -d linxsys/nginx:1.0 /bin/sh
