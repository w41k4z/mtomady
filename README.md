# MTOMADY Project

A comprehensive installation guide for setting up the MTOMADY system.

## Prerequisites

Before starting the installation process, ensure you have:

- Docker installed on your system
- Docker Compose plugin configured

## Installation Guide

Follow these steps to set up the MTOMADY environment:

### Step 1: Clone Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/w41k4z/mtomady.git
cd mtomady
```

### Step 2: Start Containers

Start the containers using Docker Compose:

```bash
# For Unix/Linux/MacOS
sudo docker compose up --build

# For Windows
docker-compose up --build
```

Wait for the MTOMADY server container to initialize completely. Note that initialization takes longer on Windows systems.

### Step 3: Database Setup

The application rely on some database view for the client part.

1. Open a new terminal and identify the Postgres container ID:

```bash
# For Unix/Linux/MacOS
sudo docker ps

# For Windows
docker ps
```

2. Access the Postgres container:

```bash
# Replace <postgres_container_id> with the actual ID from the previous step
# For Unix/Linux/MacOS
sudo docker exec -it <postgres_container_id> bash

# For Windows
docker exec -it <postgres_container_id> bash
```

3. Connect to the database:

```sql
psql -U root -d mtomady
```

4. Execute the setup script:
   Navigate to the script folder within the project directory and execute the contents of `script.sql` to create the necessary database views.

## System Access

Once installation is complete, access the system through:

- Client Interface: [http://localhost:3000](http://localhost:3000)
- Admin Panel: [http://localhost:3000/admins/sign_in](http://localhost:3000/admins/sign_in)
