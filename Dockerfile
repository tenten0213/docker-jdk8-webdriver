FROM java:8-jdk
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get install -y google-chrome-stable xvfb fonts-ipafont-gothic fonts-ipafont-mincho aptitude \
  && aptitude install -y xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic
ENV DISPLAY=:1
RUN Xvfb :1 -screen 0 1024x768x24