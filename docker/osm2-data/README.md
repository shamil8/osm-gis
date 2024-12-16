# OSM2-Data Directory

This directory is used to store OpenStreetMap (OSM) data files in `.osm.pbf` format. These files will be imported into the PostGIS database by the `app-osm2pgsql` service.

## Instructions

### 1. Download OSM Data
You need to download the required OSM data from Geofabrik or another trusted source. Follow these steps:

1. Go to the Geofabrik website: [https://download.geofabrik.de/](https://download.geofabrik.de/)
2. Navigate to the region or area you want to import (e.g., Antarctica, Europe, etc.).
3. Download the `.osm.pbf` file for the desired area. These files are large, so ensure you have enough disk space.

### 2. Place Data in This Directory
After downloading the `.osm.pbf` file:

1. Move or copy the file into the `osm2-data` directory.
2. Ensure the file is named appropriately for your import. For example, if you're importing data for Antarctica, the file should be named `antarctica-latest.osm.pbf`.

### 3. Data File Format
The file must be in `.osm.pbf` format. This is the format expected by `osm2pgsql`, and it is the compressed binary format for OpenStreetMap data.

### 4. Verify the File
Ensure the file is correctly placed in the directory and is named correctly before starting the OSM import process.

---

## Example File Path
If you are importing the OSM data for Antarctica, the file should be named:
```osm2-data/antarctica-latest.osm.pbf```

The `app-osm2pgsql` container will look for the `.osm.pbf` file in this directory during the import process.

---

## Notes
- You can download other regions and use their corresponding `.osm.pbf` files. Just make sure to update the container's `entrypoint` if you change the file name.
- The data import is initiated when the `app-osm2pgsql` container starts, and it reads the `.osm.pbf` file from this directory.
