#Base Layer
FROM ubuntu:18.04

ENV APP_DIR=/app

# Install dependencies with apt package manager, automatic yes to prompts
# pip to install python packages.
RUN apt-get update -y && apt-get install -y \
    python3.8 \
    python3-pip 


# Configure python installation
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip

#Copy project files over to container
COPY . $APP_DIR

# Install python packages needed for machine learning / data science
# TODO: specify dependencies in requirements.txt
RUN pip install -r $APP_DIR/requirements.txt

EXPOSE 8080
