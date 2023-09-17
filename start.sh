apt -qq update && apt -qq install -y git python3 python3-pip ffmpeg
git clone https://github.com/create-fork-repos/SaveRestrictedContentBot
cd Save*
RUN pip3 install --no-cache-dir -r requirements.txt
bash bash.sh
