FROM ubuntu

ENV http_proxy=http://username:pass@webisa.greater.com.au:8080
ENV https_proxy=http://username:pass@webisa.greater.com.au:8080
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update -y && apt-get upgrade -y 
RUN apt-get install curl vim lsb-release -y
RUN apt-get install python-pip python-dev -y
RUN apt-get install build-essential cmake git unzip pkg-config libopenblas-dev liblapack-dev -y
RUN apt-get install python-numpy python-scipy python-yaml python-matplotlib -y
RUN apt-get install libhdf5-serial-dev python-h5py -y
RUN apt-get install graphviz -y

ADD pip.conf /root/.config/pip/pip.conf

RUN pip install pydot-ng 
RUN apt-get install python-opencv -y
RUN pip install tensorflow
RUN pip install keras

RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ADD .vimrc /root/.vimrc
# RUN vim +PluginInstall +qall

CMD ["/bin/bash"]

# docker build --tag ai-ubuntu .
# docker run -d ai-ubuntu sleep infinity
# docker ps to get the container tag
# docker exec -ti 3c3315dx3544 bash
# docker system prune -a to remove old docker images
