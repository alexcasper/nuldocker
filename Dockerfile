FROM python:3.12-slim
COPY requirements/* /reqs/
RUN --mount=type=cache,target=/root/.cache/pip cd reqs && for r in *; do pip install $r; done 
WORKDIR /home/
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y git
CMD jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --no-browser

