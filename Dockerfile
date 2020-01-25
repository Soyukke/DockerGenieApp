FROM julia:1.3.1

RUN mkdir /GenieApp && \
    apt-get update && \
	apt-get install -y locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

ENV LANG="ja_JP.UTF-8"
ENV LANGUAGE="ja_JP:ja"
ENV LC_ALL="ja_JP.UTF-8"

ENV GENIE_ENV "dev"
ENV HOST "0.0.0.0"
ENV PORT "8000"

WORKDIR /GenieApp

COPY ["./GenieApp/Project.toml", "./GenieApp/Manifest.toml", "/GenieApp/"]
RUN julia --project=. -e "using Pkg; Pkg.instantiate(); Pkg.precompile()"

COPY ./GenieApp /GenieApp

CMD ["bin/server"]