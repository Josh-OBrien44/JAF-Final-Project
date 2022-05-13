# JAF-Final-Project

## Butterfly Data

### Data Dictionary
Core ID - the identification number assigned to each of the collected butterflies

Sex - the sex (male or female ) of each butterfly

LW Length - distance (in mm) from the top of left wing to the bottom

LW width - distance (in mm) from where the wing meets the body to the edge of the left wing

LW Apex A - peak point of the left wing

RW length - distance (in mm) from the top of right wing to the bottom

RW width - distance (in mm) from where the wing meets the body to the edge of the right wing

RW Apex A - peak point of the right wing

### Butterfly Script Chart 1 
![image](https://user-images.githubusercontent.com/98784364/167743735-712f8366-032b-49a4-b2d2-f2d8bd4395d4.png)

This graph shows the number of butterflies found per institution in the entire dataset. These results were created in "CabbageButterflyByInstitution."
Some of the mistakes we made/encountered includes renaming the column names to be able to read much easier and to avoid the warnings while first creating the dataset. 
The T Test performed had a null hypothesis that the average number of butterflies was 30, and the T Test showed a p-value of 0.03826, which confirmed us to reject the null hypothesis. The average value was 75.91667.
We had difficulties finding what variables and values we needed in order to determine our p-value to reject our null hypothesis.


### Butterfly Script Chart 2
![image](https://user-images.githubusercontent.com/98784364/167906975-cff7b8e5-0da3-47e0-943f-b3e62eee3ab6.png)

This graph shows the average total butterfly wing area by country. These results were created in "CabbageButterflyByLocation."
Some of the mistakes and difficulties we ran into included:
The T Test performed had a null hypothesis that the average total butterfly wing area among all countries was 560 mm, and the T Test showed a p-value of 0.03794, which confirmed us to reject the null hypothesis. The average value among all total wing area was 627.4414 mm.


### Butterfly Script Chart 3
![image](https://user-images.githubusercontent.com/98784364/167906182-7fc73749-6b97-43e3-b2b2-f18fabd4d5f0.png)

This graph shows the mean, median, minimum, and maximum values of the total wing area (mm) differentiated by male and female butterflies. These results were created in "CabbageButterflyBySex."
Some of the mistakes/difficulties we encountered in this script was creating a tidy dataframe with all of the summary statistics (mean, median, min, max). We also had some difficulty placing each summary statistic directly next to each other so that the graph showed an easier understoof representation of comparing male statistics to female statistics. 


## Ladybug Data

### Data Dictionary
Scan Code- Augustana code given to each ladybug

Species - Species type for each of the collected ladybugs

Collector - the name of the person who collected the ladybug

Country - Country the ladybug was collected from

County - County the ladybug was collected from

State Province - State Province the ladybug was collected from

Year- Year the ladybug was collected

Genus - eighth taxonomic rank used to identify the ladybugs

Kingdom - the second highest taxonomic category of the ladybugs 

Order - sixth highest taxonomic rank to identify the ladybugs

Family - seventh highest taxonomic to identify the ladybugs

Class - fifth taxonomic rank to identify the ladybugs

Phylum - fourth taxonomic rank to identify the ladybugs

Specific Epithet - descriptive term, accompanying or occurring in place of a the ladybug’s name

### Ladybug Script 1
![image](https://user-images.githubusercontent.com/98784364/167908506-6c1b8f60-2295-4ec1-8aca-406a041b9b8c.png)

This graph shows the number of ladybugs found by each specific epithet. The specific epithet of a butterfly is the specific type/branch of species it falls under. These results were created in "LadybugBySpecificEpithet."
Some of the mistakes/difficulters we ran into with this script was getting rid of the null values and creating a chart that was was easily understoof by the reader. 
We performed a T Test on this data as well, with a null hypothesis that the average number of ladybugs per epithet was 8. Our p-value resulted in a value of 0.04772, allowing us to reject our null hypothesis. The average number of ladybugs per epithet was 36.66667.


### Ladybug Sript 2
![image](https://user-images.githubusercontent.com/98784364/167916686-1300943c-2d7f-436e-90d1-2fbacd11d504.png)







