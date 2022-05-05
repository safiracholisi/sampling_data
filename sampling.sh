#!/bin/bash

# Download data dan simpan ke folder "data"
wget -P ./data https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

# Convert setiap sheet dalam data ke masing-masing file CSV
in2csv ./data/weather_data.xlsx --sheet "weather_2014" > data/weather_2014.csv
in2csv ./data/weather_data.xlsx --sheet "weather_2015" > data/weather_2015.csv

# Gabungkan file-file CSV ke dalam satu file CSV dengan nama weather.csv
csvstack data/weather_2014.csv data/weather_2015 csv > data/weather.csv

# Hapus file awal data
rm ./data/weather_data.xlsx

# Lakukan sampling pada file weather.csv dengan rate 0.3 dan
# simpan ke file baru bernama sample_weather.csv
cat data/weather.csv | sample -r 0.3 > data/sample_weather.csv
