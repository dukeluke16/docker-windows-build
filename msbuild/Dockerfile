# Pull base image.
FROM microsoft/windowsservercore:ltsc2016
MAINTAINER Luke Thompson <luke@dukeluke.com>
LABEL Description="Visual Studio 2017 Build Tools (v15.0)"

# Copy our Install script.
COPY Install.cmd C:\\TEMP\\Install.cmd

# Download collect.exe in case of an install failure.
ADD https://aka.ms/vscollect.exe C:\\TEMP\\collect.exe

# Use the latest release channel. For more control, specify the location of an internal layout.
ARG CHANNEL_URL=https://aka.ms/vs/15/release/channel
ADD ${CHANNEL_URL} C:\\TEMP\\VisualStudio.chman

# Download and install Build Tools excluding workloads and components with known issues.
ADD https://aka.ms/vs/15/release/vs_buildtools.exe C:\\TEMP\\vs_buildtools.exe
RUN C:\\TEMP\\Install.cmd  C:\\TEMP\\vs_buildtools.exe --quiet --wait --norestart --nocache \
    --installPath C:\\BuildTools \
    --channelUri C:\TEMP\VisualStudio.chman \
    --all \
    --remove Microsoft.VisualStudio.Component.Windows10SDK.10240 \
    --remove Microsoft.VisualStudio.Component.Windows10SDK.10586 \
    --remove Microsoft.VisualStudio.Component.Windows10SDK.14393 \
    --remove Microsoft.VisualStudio.Component.Windows81SDK

# Start developer command prompt with any other commands specified.
ENTRYPOINT C:\BuildTools\Common7\Tools\VsDevCmd.bat &&

# Default to PowerShell if no other command specified.
CMD ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]
