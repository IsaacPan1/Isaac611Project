# Use the base image from rocker/verse
FROM rocker/verse

# Update package list and install man-db, unminimize the system
RUN apt-get update && apt-get install -y man-db && yes | unminimize && rm -rf /var/lib/apt/lists/*