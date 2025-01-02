FROM python:3.7-slim

ENV PIP_ROOT_USER_ACTION ignore
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/America/Bogota /etc/localtime

RUN apt update

WORKDIR /usr/src/app
COPY . .
RUN pip install --no-cache-dir --disable-pip-version-check --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r requirements.txt

CMD [ "python", "-m", "unittest", "discover", "-s", "tests", "-t", "." ]
