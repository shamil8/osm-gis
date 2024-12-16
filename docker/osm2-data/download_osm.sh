#!/bin/bash

# Base URL for Geofabrik download site
base_url="https://download.geofabrik.de"

# Path where you want to store the downloaded files
output_dir="./"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# List of Geofabrik regions (you can modify or extend this list)
regions=(
  "africa"
  "asia"
  "europe"
  "north-america"
  "south-america"
  "australia-oceania"
  "antarctica"
)

# Loop through the regions and download .osm.pbf files
for region in "${regions[@]}"; do
  echo "Downloading $region..."
  region_url="$base_url/$region-latest.osm.pbf"

  # Download the file using wget
  wget -q --show-progress --directory-prefix="$output_dir" "$region_url"
done

echo "All downloads are complete."