FROM ubuntu:22.04

ARG pwd_default=jupyter
ENV NOTEBOOK_PWD=$pwd_default

RUN apt-get update
RUN apt-get install wget -y

WORKDIR /tmp

RUN wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
RUN bash Anaconda3-2023.09-0-Linux-x86_64.sh -b -p /root/anaconda3
RUN echo "export PATH=$PATH:/root/anaconda3/bin" >> /root/.bashrc
RUN /bin/bash -c "source /root/.bashrc"

WORKDIR /
ENTRYPOINT /root/anaconda3/bin/jupyter notebook --ip=0.0.0.0 --port=8888 --NotebookApp.token=$NOTEBOOK_PWD --allow-root --no-browser --notebook-dir=/home/

