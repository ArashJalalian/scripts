FROM ubuntu

ENV http_proxy=http://ajalalian:Mrsn0ur18@webisa.greater.com.au:8080
ENV https_proxy=http://ajalalian:Mrsn0ur18@webisa.greater.com.au:8080
ENV DEBIAN_FRONTEND=noninteractive

ADD pip.conf /root/.config/pip/pip.conf

RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install curl vim lsb-release -y
RUN apt-get install python-pip python-dev -y
RUN apt-get install build-essential cmake git unzip pkg-config libopenblas-dev liblapack-dev -y
RUN apt-get install python-numpy python-scipy python-yaml python-matplotlib -y
RUN apt-get install libhdf5-serial-dev python-h5py -y
RUN apt-get install graphviz -y
RUN pip install pydot-ng 
RUN apt-get install python-opencv -y
RUN pip install tensorflow
RUN pip install keras

CMD ["/bin/bash"]

# docker build --tag ai-ubuntu .
# docker run -d ai-ubuntu sleep infinity
# docker ps to get the container tag
# docker exec -ti 3c3315dx3544 bash