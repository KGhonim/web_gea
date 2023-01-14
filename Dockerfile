
FROM python:latest

# Install the Robot Framework and any other dependencies
RUN pip install robotframework
RUN pip install requests
RUN pip install robotframework-requests
RUN pip install robotframework-jsonlibrary


# verify installed 
RUN pip list


# Add the test scripts to the image
COPY . /app
WORKDIR /app

# Run the test scripts when the container is launched

#ENTRYPOINT ["robot"]
CMD ["--outputdir", "/app/output", "/app/Tests"]


