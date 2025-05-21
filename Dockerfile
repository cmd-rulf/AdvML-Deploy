FROM silentdemonsd/wzmlx:hk

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get update\
    && apt-get install -y curl\
    && curl -O https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megacmd-xUbuntu_22.04_amd64.deb\
    && apt-get install -y ./megacmd-xUbuntu_22.04_amd64.deb

COPY . .
RUN pip install --upgrade pip setuptools
RUN pip3 install --no-cache-dir -r requirements.txt


CMD ["bash", "start.sh"]
