FROM ubuntu

ENV http_proxy=http://username:pass@myproxy.com:8080
ENV https_proxy=http://username:pass@myproxy.com:8080
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install build-essential cmake git unzip pkg-config libopenblas-dev liblapack-dev wget -y

# other tools
RUN apt-get update && apt-get upgrade -y
RUN apt-get install vim curl -y

# Install kubectl
RUN apt-get update && apt-get install -y apt-transport-https
RUN wget https://packages.cloud.google.com/apt/doc/apt-key.gpg --no-check-certificate &&  apt-key add ./apt-key.gpg && rm -rf ./apt-key.gpg
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl

# install vundle
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ADD .vimrc /root/.vimrc

RUN git clone https://github.com/ArashJalalian/axon-rabbit-sample.git
RUN git config --global user.email "arash.jalalian@gmail.com"
RUN git config --global user.name "Arash Jalalian"


CMD ["/bin/bash"]

# docker build --tag ai-ubuntu .
# docker run -d ai-ubuntu sleep infinity
# docker run -v c:/:/win_c -d dev sleep infinity    before this command you will need to share a folder in docker ui
# docker exec -ti 3c3315dx3544 bash
