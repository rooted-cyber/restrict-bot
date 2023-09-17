
FROM python:3.9.2-slim-buster

RUN mkdir /app && chmod 777 /app

# Changed the package manager command from 'apt' to 'apt-get'
# Also, 'python3' package is already included in the base image, so it doesn't need to be installed separately
# Removed 'python3-pip' package installation as pip is already included in the base image
RUN apt-get -qq update && apt-get -qq install -y git ffmpeg

# Changed the working directory to 'SaveRestrictedContentBot'
WORKDIR /app/SaveRestrictedContentBot

# Removed the semi-colons from the 'git clone' and 'git pull' commands
RUN git clone https://github.com/create-fork-repos/SaveRestrictedContentBot && \
    cd SaveRestrictedContentBot && \
    git pull && \
    cat main/*init*

# Fixed the typo in the directory name from 'Save*Bot' to 'SaveRestrictedContentBot'
# Also removed the unnecessary 'cd Save*' command
RUN cd SaveRestrictedContentBot && \
    pip install --no-cache-dir -r requirements.txt

# Removed the unnecessary 'cd Save*' command
RUN cd SaveRestrictedContentBot;bash bash.sh
