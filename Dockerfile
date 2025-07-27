FROM ubuntu:20.04

ENV TZ=Europe/London

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update

RUN apt-get install ffmpeg libsm6 libxext6 wget unzip libnss3-dev libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev curl python3-pip -y

COPY . .

RUN pip install -r requirements.txt

RUN wget https://storage.googleapis.com/chrome-for-testing-public/126.0.6478.126/linux64/chromedriver-linux64.zip

RUN unzip chromedriver-linux64.zip -d /usr/bin/

RUN wget https://storage.googleapis.com/chrome-for-testing-public/126.0.6478.126/linux64/chrome-linux64.zip

RUN mkdir /usr/bin/chromium

RUN unzip chrome-linux64.zip -d /usr/bin/chromium/

RUN chmod +777 /usr/bin/chromedriver-linux64/chromedriver

CMD ["python3", "main.py"]
