#!/bin/bash
docker run -itd -p 8888:8888 -v  ${1}:/home/ --name filedgr-anaconda filedgr/anaconda3:latest 
