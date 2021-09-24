FROM python:3-slim AS builder
ADD . /app
WORKDIR /app
# We are installing a dependency here directly into our app source dir
RUN pip install --target=/app scikit-image

FROM gcr.io/distroless/python3-debian10:debug
COPY --from=builder /app /app
WORKDIR /app
ENV PYTHONPATH /app
CMD ["/app/main.py"]