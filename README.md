# BVND-Visualization

## BVND package
library(devtools)  
devtools::install_github('ruiqili2/BVND-Visualization/BVND')

## Shiny Web App
Plotly -> interactive plot

## Run App Inside R
1. Open ui.R and server.R
2. click on run app button on the top right corner

## Run App Outside R
1. Navigate to the git folder
2. **python run_app.py**

ps: Ideally the python script will figure out the current work dir and throw it into R -e "shing::runApp(pwd)". If it's not work, well, welcome to the real world.


![Preview](https://github.com/ruiqili2/BVND-Visualization/blob/master/bndplot.png)

## Resource
http://www2.stat.duke.edu/~rcs46/lectures_2015/02-multivar2/02-multivar2.pdf
