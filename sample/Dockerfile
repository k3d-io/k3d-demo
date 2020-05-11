FROM python:3.7-slim

ENV PATH="/app/bin:${PATH}" \
    PYTHONPATH=/app/src 

COPY . /app/

RUN pip3 install -r /app/conf/app/requirements.txt

WORKDIR /app

ENTRYPOINT ["/bin/bash", "-c"]

