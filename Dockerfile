# Pull the Python image from Docker Hub
FROM python:3.14-slim

# set the working directory inside container
WORKDIR /app

# Copy dependency list before copying application code
COPY requirements.txt .

# install the dependencies
RUN pip install -r requirements.txt

# copy application code and saved model inside app
COPY . .

# Document the posrt used by the FastAPI application
EXPOSE 8000

# Start the API server when container is ready
# 0.0.0.0 - allows connections through the containers netowrk interface
CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000"]