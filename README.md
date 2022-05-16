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

This graph shows the number of butterflies found per institution in the entire dataset. These results were created in "CabbageButterflyByInstitution.R."

To begin, we set the working directory and defined the dataset to the "CompletePierisData_2022-03-09." Following this, we renamed the column names to make the datafram emuch easier to read and easier to access those file name, especially since they had warnings due to the columns including "dwc" in the column name. We did this by using the dplyr::rename() function. After our column names were cleaned, we created a much smaller dataframe only utilizing the Institution name as a column, and the count of butterflies found per institution as the second column. This made it much easier to create a bar chart to visualize the differences between institutions' collections. To create this dataframe, we first defined a new dataframe, using the untidy dataframe we had already defined, and then cleaned it using the dplyr::group_by() and dplyr::summarise(number=n()) functions. Next we plotted the smaller dataframe as a bar chart, with the institution names on the x-axis and the count value on the y-axis, which very clearly showed which institutions collected the most and least amount of data. To do this, we used the ggplot() functions and utilized the specific details to get the dimensions and labelss that were most descriptive of the data. Lastly, the T Test performed had a null hypothesis that the average number of butterflies was 30, and the T Test showed a p-value of 0.03826, which confirmed us to reject the null hypothesis. The average value was 75.91667.

Some of the mistakes and difficulties we ran into included: 
- Renaming the column names to be able to read much easier and to avoid the warnings while first creating the dataset. 
- We had difficulties finding what variables and values we needed in order to determine our p-value to reject our null hypothesis.


### Butterfly Script Chart 2
![image](https://user-images.githubusercontent.com/98784364/167906975-cff7b8e5-0da3-47e0-943f-b3e62eee3ab6.png)

This graph shows the average total butterfly wing area by country. These results were created in "CabbageButterflyByLocation.R."

To start this script we again set the working directory and called both datasets this time, "CompletePierisData_2022-03-09" and "Cleaned Data LWA." After calling the datasets we then cleaned/manipulated them. For the "CompletePierisData_2022-03-09" set, most of the column names started with "dwc:" so we cleared all instances of that to make the column names easier to read. We also fixed inconsistencies with some of the country names by changing U.S.A. and USA to United States by using the str_replace function. For the "Cleaned Data LWA" set we only really had to rename columns by taking the spaces out which just made them easier to call on later. After cleaning the datasets, we created new dataframes with only the columns we needed from each dataset by using dplyr::select. We used the coreID and country columns from the "CompletePierisData_2022-03-09" and the coreID, lwLength, lwWidth, rwLength, and rwWidth columns from the "Cleaned Data LWA" set. Once the new dataframes were created, we then combined them into one dataframe with the left_join function by using "coreID" as the connector/primary key. Within this left join, the dplyr::mutate function was used to create the lwArea(left wing area)(lwLength * lwWidth), rwArea(right wing area)(rwLength * rwWidth), and totalWingArea(lwArea + rwArea) values. Following the completion of the join, we used the na.omit function on our joined dataframe to get rid of any records that contained a null/NA value. Now that all of the data was cleaned and joined, it was time to create our visualization. To begin this process we created one last new dataframe that grouped the data by country (using the dplyr::group_by function) and showed the average total wing area of all butterflies found in that country (using the dplyr::summarise function). From here we used ggplot to create our bar chart for which we used country as the x-axis value, avg total wing area as the y-axis value, changed the titles to match the values, and used the theme function to put the bar titles at an angle, thus making them easier to read. The finished product is the chart above this explanation that again illustrates the average total butterfly wing area by country.

Some of the mistakes and difficulties we ran into included:
- The T Test performed had a null hypothesis that the average total butterfly wing area among all countries was 560 mm, and the T Test showed a p-value of 0.03794, which confirmed us to reject the null hypothesis. The average value among all total wing area was 627.4414 mm.
- We tried to used dplyr::mutate the fix the inconsistencies with the country names but found str_replace to be easier.
- Constantly renaming columns and dataframes became frustrating as we often forgot to change where those columns or dataframes were called on later in the script, which caused issues in getting the script to run.


### Butterfly Script Chart 3
![image](https://user-images.githubusercontent.com/98784364/167906182-7fc73749-6b97-43e3-b2b2-f18fabd4d5f0.png)

This graph shows the mean, median, minimum, and maximum values of the total wing area (mm) differentiated by male and female butterflies. These results were created in "CabbageButterflyBySex.R."

For this script, after setting the working directory like all others, we only needed to call the "Cleaned Data LWA" dataset. The cleaning for this dataset only included the renaming of columns simply for the sake of making them easier to call later on. For example, changing the name from "lw Length" to "lwLength" by using the dplyr::rename function. After the dataset was cleaned/manipulated we created a new dataframe that included only the columns we needed to use as well as new columns we created. We used the dplyr::select function to select the coreID, sex, lwLength, lwWidth, rwLength, and rwWidth columns and used the dplyr::mutate function three times to create the same lwArea, rwArea, and totalWingArea columns that we created in chart 2. Once our dataframe with everything we needed was made, we once again ran the na.omit function on the dataframe to remove any records with null/NA values. Once this step was complete, it was time to create the chart you see above. In order to do this, we created a new dataframe that grouped the data by sex (dplyr::group_by(sex)) and gave the four summary values of mean, median, min, and max for both females and males (dplyr::summarise(areaMean = mean(totalWingArea), areaMin = min(totalWingArea), areaMedian = median(totalWingArea), areaMax = max(totalWingArea)). Once the summary values were created, the data table was more wide than it was long. We wanted to fix this and tidy the data. We did so by using the dplyr::gather function that, in simple terms, rotates your data or turns the columns into rows. In addition to this, we also combined the sex and summary values to make the data table even tidier by having only two columns (name (sex and summary stat) and that value of that summary stat). We used the dplyr::unite function to accomplish this task (example: the mean for the total wing area of females was given the name female_areaMean). After the tidying of the data, we were ready to plot the data. We once again utilized the ggplot function in R. For this plot, our x-axis value was set to the name of summary statistic (sex + stat) and our y-axis value was set to the value of the summary statistics. For our x-axis value, we had to used the fct_inorder function from the forcats library which allowed the plot to show the summary statistics in the order they appeared in the data table instead of grouping them by sex on the plot. This allows for better visual comparison between the two sexes. The outcome of all these steps is the chart you see above this summary that illustrates the summary statistics (mean, median, min, max) for both female and males cabbage butterflies.

Some of the mistakes and difficulties we ran into included:
- Creating a tidy dataframe with all of the summary statistics (mean, median, min, max). Eventually solved this issue by using the dplyr::gather and dplyr::unite functions.
- We also had some difficulty placing each summary statistic directly next to each other so that the graph showed an easier-to-understand representation of comparing male statistics to female statistics. This difficulty was eased with the employment of the fct_inorder function that allowed us to plot our data in the order in which it appeared in the dataframe table.


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

This graph shows the number of ladybugs found by each specific epithet. The specific epithet of a butterfly is the specific type/branch of species it falls under. These results were created in "LadybugBySpecificEpithet.R."

To start with this dataset, we again set the working directory and defined the datasets using both "Ladybug Data" and "Scan Ladybug Data." From here, we selected the columns in which we decided would be useful to the data we wanted to visualize, and then renamed some of the column names to make it easier to read and access. Then, we combined the two dataframes to utilize data from each, and omitted null values that were not useful towards our necessary data. To do this, we used dplyr::select(), dplyr::rename(), and na.omit() functions. From here, we created a new dataframe using only the necessary columns to show the specific epithet and its count. This dataframe had two columns; one with each Epithet name and a second with its total count found. To do this, we used functions dplyr::group_by(), and dplyr::summarise(number=n()). Next we visualized the data in a bar chart comparing the count of each epithet. We did this using the ggplot() function. Finally, we performed a T Test on this data as well, with a null hypothesis that the average number of ladybugs per epithet was 8. Our p-value resulted in a value of 0.04772, allowing us to reject our null hypothesis. The average number of ladybugs per epithet was 36.66667.

Some of the mistakes and difficulties we ran into included:
- Getting rid of the null values and creating a chart that was was easily understood by the reader. 


### Ladybug Sript 2
![image](https://user-images.githubusercontent.com/98784364/167916686-1300943c-2d7f-436e-90d1-2fbacd11d504.png)






### Ladybug Script 3
![image](https://user-images.githubusercontent.com/98784364/168387712-d27c1212-fd84-4db8-b0a5-9522d97fabd1.png)




