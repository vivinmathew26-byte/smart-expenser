FROM python:3.11-slim

WORKDIR /app

COPY aaron45.py .

ENV PORT=8000

EXPOSE 8000

CMD ["python3", "aaron45.py"]