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

### If you use PostgREST need to add bellow user to PostGis:

```sql
GRANT USAGE ON SCHEMA public TO app;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO app;
```

4.	After the PostgREST is running, you can access your PostgREST at http://localhost:3000 (depending on your configuration).

# Last fix PostGIS with OSM data in Server  🔧
Push data to PostGis db from  OSM-pgsql container:
Access the osm2pgsql container and run the command below to check the transferred data:
```shell
osm2pgsql -d app_db -U app -H app-gis-db --create --slim -C 8000 --number-processes 8 -v -S /usr/local/share/osm2pgsql/default.style antarctica-latest.osm.pbf
```

Example get three Cafe: `curl "http://localhost:3003/planet_osm_point?amenity=eq.cafe&limit=3"`

1. First command: `docker exec -it app-gis-db sh`
2. Go to pgsql (pass: root): `psql -h app-gis-db -U app -d app_db`
3. ANALYZE points: `ANALYZE public.planet_osm_point;`
4. Select data inside PostGis DB:
```sql
SELECT
    ST_X(ST_Transform(way, 4326)) AS x,
    ST_Y(ST_Transform(way, 4326)) AS y,
    name,
    amenity
FROM
    public.planet_osm_point
WHERE
    amenity = 'cafe'
LIMIT 3;
```
and also increased wall size param in PostGis!
