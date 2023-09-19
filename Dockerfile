# Start your image with a node base image
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

#
## conda envirenment and depencdenies
## Remove any third-party apt sources to avoid issues with expiring keys.
#RUN rm -f /etc/apt/sources.list.d/*.list
#
## Install some basic utilities
##RUN apt-get update && apt-get install -y \
##    curl \
##    ca-certificates \
##    sudo \
##    git \
##    bzip2 \
##    libx11-6 \
## && rm -rf /var/lib/apt/lists/*
#
## Create a working directory
#RUN mkdir /app
#WORKDIR /app
#
## Create a non-root user and switch to it.
#RUN adduser --disabled-password --gecos '' --shell /bin/bash user \
# && chown -R user:user /app
#RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
#USER user
#
## All users can use /home/user as their home directory
##ENV HOME=/home/user
##RUN mkdir $HOME/.cache $HOME/.config \
## && chmod -R 777 $HOME
COPY ./requirements.txt .
RUN pip install -r requirements.txt



# Set the default command to python3.
SHELL ["/bin/bash", "-c"]