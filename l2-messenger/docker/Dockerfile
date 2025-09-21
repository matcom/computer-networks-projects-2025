FROM python:3.12-slim
WORKDIR /app
COPY src ./src
ENV PYTHONPATH=/app/src
CMD ["python","-m","l2msg.cli"]
