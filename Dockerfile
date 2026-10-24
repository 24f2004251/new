FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    MAILROOM_DB_PATH=/var/data/mailroom_agent.db

WORKDIR /app

COPY mailroom_requirements.txt .
RUN pip install --no-cache-dir -r mailroom_requirements.txt

COPY mailroom_agent.py .

EXPOSE 10000

CMD ["sh", "-c", "uvicorn mailroom_agent:app --host 0.0.0.0 --port ${PORT:-10000}"]
