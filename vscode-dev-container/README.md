# VS Code Dev Container

## Install

* [VS Code](https://code.visualstudio.com/)
* [Remote Development Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

## Usage

* Copy `.devcontainer` and `.vscode` to your theos project.
* Reopen the project in container.

Learn more about [developing inside a container](https://code.visualstudio.com/docs/remote/containers).

## Configuration

* `.devcontainer/Dockerfile`  
  Setup additional dependencies and tools.
* `.vscode/settings.json`  
  Customize compiler flags for code intellisense.
* `.vscode/tasks.json`  
  Add more predefined tasks for your workflow.
