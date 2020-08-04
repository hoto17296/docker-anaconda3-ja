FROM continuumio/anaconda3:2020.07

SHELL ["/bin/bash", "-l", "-c"]

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

# Install CUDA and cuDNN
RUN conda install -y cudatoolkit cudnn

# Install Japanese Font
RUN apt-get update \
  && apt-get install -y fonts-takao-gothic \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && echo -e "\nfont.family: TakaoPGothic" >> $(python -c 'import matplotlib as m; print(m.matplotlib_fname())') \
  && rm -f ~/.cache/matplotlib/font*

# Support Google Colaboratory
RUN pip install jupyter_http_over_ws \
  && jupyter serverextension enable --py jupyter_http_over_ws

RUN echo 'exec "$@"' > /entrypoint.sh
ENTRYPOINT ["/bin/bash", "-l", "/entrypoint.sh"]
