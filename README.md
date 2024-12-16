# OSM GIS Repository

This repository provides a setup for managing OpenStreetMap (OSM) data with a **PostGIS** database and rendering tiles using **Mapnik** and **Tileserver-GL**. Follow the instructions below to get started.

## Prerequisites

Before starting, make sure you have the following tools installed:

- **Docker** and **Docker Compose**
- **wget** (for downloading OSM data)

If you don’t have `wget` installed, you can install it using **Homebrew** on macOS:

```bash
brew install wget
```

## Step 1: Download OSM Data
1.	First, clone this repository to your local machine:
```bash
git clone https://github.com/shamil8/osm-gis.git
cd osm-gis
```

2. Inside the osm-gis directory, you’ll find a script to download the required .osm.pbf files from Geofabrik. Run the script using the following command:
```bash
cd docker
bash ./osm2-data/download_osm.sh
```

This will download the latest OSM data for various regions (Africa, Asia, Europe, etc.) and store them in the osm_pbf_files folder.

## Step 2: Run Docker Compose
1. Run the following command to start the Docker containers:

```bash
docker-compose up
```

This will:
	•	Start a PostGIS database container.
	•	Start the Tileserver to render and serve tiles.
	•	Start any other services needed for your OSM setup.
The process might take a few minutes to complete as it pulls the necessary Docker images and starts the containers.

3.	After the services are running, you can access your Tileserver at http://localhost:7800 (depending on your configuration).
