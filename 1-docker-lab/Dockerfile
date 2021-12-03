FROM python:alpine3.7
COPY . /flask-app
WORKDIR /flask-app
RUN pip install -r requirements.txt
EXPOSE 5500
CMD python ./flask-app.py
