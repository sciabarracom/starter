FROM nixpkgs/devcontainer:nixos-23.11

COPY . /home/nuvolaris/
RUN groupadd --gid 1000 nuvolaris \
  && useradd -s /bin/bash --uid 1000 --gid 1000 nuvolaris
  && cd /home/nuvolaris && nix-shell --run "exit"
  && chown -R 1000:1000 /nix

USER nuvolaris
WORKDIR /home/nuvolaris
CMD ["sleep", "inf"]