# REST API testing using Robot Framework


This project is centered on **REST API TESTING** where the main task is to **write and execute tests** for a simple REST server implementation.  

# The setup includes:
- A provided REST server (`server/server.py`).
- Automated tests to validate the REST API functionality.
- Dockerized environment to run both the server and the tests in isolated containers.
- Documentation of actions taken, findings, and any missing tests.

## Assignment Objectives

1. Write tests for the simple REST server using the provided APIs.
2. Run the server and the tests in separate **Docker containers**.
3. Provide instructions on how to run the server and the tests.
4. Document actions taken and note any missing tests or bugs found in the server.

## REST Server Specification

# The REST server exposes the following endpoints:

### **[GET] /items/?param=value**
- **Description:** List all items when no param is given. Filter by `param=value` (e.g., `/items/?tag=test`).
- **Response:**
  - `200 OK`: `[{'name': 'item_1', ...}, ...]`

### **[GET] /items/<name>/**
- **Description:** Get an item by name.
- **Response:**
  - `200 OK`: `{'name': 'item_1', 'serial': '12345', ...}`
  - `404 Not Found`: `{'error': 'message'}`

### **[POST] /items/**
- **Description:** Add a new item.
- **Input Example:**
  ```json
  {
    "name": "item_name",
    "email": "test@ssh.com"
  }

# Build image and run robot tests
 - docker compose up -d --build
 - docker compose up --build
