FROM nixpkgs/devcontainer:nixos-23.11

# This Dockerfile adds a non-root user with sudo access. Use the "remoteUser"
# property in devcontainer.json to use it. On Linux, the container user's GID/UIDs
# will be updated to match your local UID/GID (when using the dockerFile property).
# See https://aka.ms/vscode-remote/containers/non-root-user for details.
ARG USERNAME=nuvolaris
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -m -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

COPY default.nix .
COPY nuv/default.nix nuv/default.nix
# Make the /nix store writable to the user
RUN chown -R $USER_UID:$USER_GID /nix
USER nuvolaris
WORKDIR /home/nuvolaris
RUN echo "exec nix-shell" >.bashrc && nix-shell --run "exit"

CMD ["sleep", "inf"]