FROM python:3.9.2-slim-buster
RUN mkdir /app && chmod 777 /app

WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq update && apt -qq install -y git python3 python3-pip ffmpeg git
RUN git clone https://github.com/create-fork-repos/SaveRestrictedContentBot;cd Save*;git pull;cat main/*init*
RUN cd Save*Bot;pip3 install --no-cache-dir -r requirements.txt
RUN cd Save*;bash bash.sh
