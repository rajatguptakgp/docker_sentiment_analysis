FROM ubuntu:18.04
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt clean \ 
    && rm -rf /var/lib/apt/lists/ \
    && apt update --fix-missing \ 
    && apt install -y htop python3-dev wget

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.10.3-Linux-x86_64.sh \
    && mkdir root/conda \
    && sh Miniconda3-py37_4.10.3-Linux-x86_64.sh -b \ 
    && rm -f Miniconda3-py37_4.10.3-Linux-x86_64.sh

RUN conda create -y -n my_env_prod python=3.7    

COPY . flask_api/
RUN cd /flask_api
WORKDIR /flask_api

RUN /bin/bash -c "source activate my_env_prod && pip install -r requirements.txt"

EXPOSE 3000
ENTRYPOINT ["tail", "-f", "/dev/null"]