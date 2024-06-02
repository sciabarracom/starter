FROM nixpkgs/devcontainer:nixos-23.11

COPY . /home/nuvolaris/
RUN cd /home/nuvolaris \
    && nix-shell --run "exit" \
    && groupadd --gid 1000 nuvolaris \
    && useradd -s /bin/bash --uid 1000 --gid 1000 nuvolaris \
    && chown -R 1000:1000 /nix /home/nuvolaris

USER nuvolaris
WORKDIR /home/nuvolaris
RUN nix-shell --run "exit"
CMD ["sleep", "inf"]