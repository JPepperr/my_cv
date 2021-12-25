FROM ubuntu:18.10

RUN sed -i 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get install --yes --no-install-recommends \
	texlive-fonts-recommended	\
	texlive-generic-recommended	\
	texlive-latex-extra		\
	texlive-fonts-extra		\
	dvipng				\
	texlive-latex-recommended	\
	texlive-base			\
	texlive-pictures		\
	texlive-lang-cyrillic		\
	texlive-science			\
	cm-super			\
	texlive-generic-extra		\
	texlive-bibtex-extra

ADD ./CV/ /cv/
RUN cd /cv/ && pdflatex -interaction=nonstopmode main.tex
