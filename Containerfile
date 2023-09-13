FROM quay.io/toolbx-images/archlinux-toolbox

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="LFS Installer" \
      maintainer="vinnitetho@gmail.com"

COPY extra-packages /
RUN pacman -Syy
RUN pacman -Suu  
RUN grep -v '^#' /extra-packages | xargs pacman -Sy
RUN rm /extra-packages

RUN   ln -fs /bin/sh /usr/bin/sh && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
      ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update
     
# Custom Command
# ENV ENV=/root/.ashrc

# RUN   cd /root/
# RUN   wget https://raw.githubusercontent.com/sudofox/shell-mommy/master/shell-mommy.sh
# RUN   chmod a+x shell-mommy.sh
# RUN   cat shell-mommy.sh >> .ashrc
