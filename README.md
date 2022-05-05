# sampling.sh

Script name: sampling.sh

The bash script is designed to perform the following tasks:

1. Download an excel file and save it to the folder <data>:
  
  wget -P ./data https://github.com/labusiam/dataset/raw/main/weather_data.xlsx

2. Convert every sheet inside the file to individual CSV files:
  
  in2csv ./data/weather_data.xlsx --sheet "weather_2014" > ./data/weather_2014.csv
  
  in2csv ./data/weather_data.xlsx --sheet "weather_2015" > ./data/weather_2015.csv

3. Join the CSV files into one CSV file named <weather.csv>:
  
  csvstack ./data/weather_2014.csv ./data/weather_2015.csv > ./data/weather.csv

4. Delete the initial excel file:
  
  rm ./data/weather_data.xlsx
  
5. Conduct sampling on the file <weather.csv> with a rate 0.3 save the 
   result into a new file named <sample_weather.csv>:
  
  cat ./data/weather.csv | sample -r 0.3 > ./data/sample_weather.csv
