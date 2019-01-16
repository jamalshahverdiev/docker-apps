FROM python:3.6-alpine
WORKDIR /app
ADD https://github.com/jamalshahverdiev/vagrant-codes-in-practice/raw/master/vagrant-nomad-consul-vault/temps/pyApp.tgz /app/
RUN tar zxvf pyApp.tgz && pip install -r requirements.txt
EXPOSE 9080
CMD ["python", "/app/routes.py"]
