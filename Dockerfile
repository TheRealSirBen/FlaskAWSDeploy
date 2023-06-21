FROM ubuntu:22.04
MAINTAINER william.jonahel@minofangle.org

RUN apt-get update -y
RUN apt-get install -y python3-pip

# Copy the current directory contents into the container at /app
COPY . /opt/

# Set the working directory to /app
WORKDIR /opt

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app", "--workers=5"]
