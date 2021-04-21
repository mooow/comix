FROM python:latest

WORKDIR /app
COPY requirements.txt /app
RUN pip install -r requirements.txt

COPY *.py /app

ENTRYPOINT ["python", "comix.py"]
CMD ["list"]
