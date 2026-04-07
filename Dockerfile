FROM python:3.12-alpine

RUN apk add --no-cache python3 py3-pip
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt


EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]