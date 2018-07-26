FROM continuumio/anaconda3

RUN apt update \
  && apt install -y fonts-takao-gothic \
  && apt clean \
  && rm -rf /var/lib/apt/lists/

RUN echo "\nfont.family: TakaoPGothic" >> $(python -c 'import matplotlib as m; print(m.matplotlib_fname())') \
  && rm -f ~/.cache/matplotlib/font*
