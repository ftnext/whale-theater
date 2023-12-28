FROM python:3.11 as builder
ARG OPENAI_VERSION
RUN python -m pip install --no-cache-dir openai==${OPENAI_VERSION}

FROM python:3.11-slim
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
WORKDIR /work
COPY openai-transcribe/main.py /work/main.py
ENTRYPOINT [ "python", "main.py" ]
CMD [ "-h" ]
