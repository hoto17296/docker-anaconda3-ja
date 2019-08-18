FROM continuumio/anaconda3:2019.07

SHELL ["/bin/bash", "-l", "-c"]

# Install Japanese Font
RUN apt-get update \
  && apt-get install -y fonts-takao-gothic \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && echo "\nfont.family: TakaoPGothic" >> $(python -c 'import matplotlib as m; print(m.matplotlib_fname())') \
  && rm -f ~/.cache/matplotlib/font*

# Support Google Colaboratory
RUN pip install jupyter_http_over_ws \
  && jupyter serverextension enable --py jupyter_http_over_ws

RUN echo 'exec "$@"' > /entrypoint.sh
ENTRYPOINT ["/bin/bash", "-l", "/entrypoint.sh"]
