# school-shootings

This code uses school shootings data from the Washington Post and the American Community Survey to calculate the risk of a child being enrolled in a school while there is a school shooting. The risk is calculated as if a child goes through every grade. The calculation is illustrated below, using 2021 data for students of all races and any type of shooting.

**Grade**|**Total enrollment**|**Shooting enrollment**|**Rate**|**1 - Rate**
:-----:|:-----:|:-----:|:-----:|:-----:
K| 4,011,764 | 417 |0.000104|0.999896
1| 3,797,130 | 529 |0.000139|0.999861
2| 3,841,588 | 529 |0.000138|0.999862
3| 4,024,594 | 529 |0.000132|0.999868
4| 4,065,313 | 529 |0.000130|0.999870
5| 4,189,262 | 703 |0.000168|0.999832
6| 4,264,316 | 1,719 |0.000403|0.999597
7| 4,202,987 | 2,409 |0.000573|0.999427
8| 4,262,334 | 2,335 |0.000548|0.999452
9| 4,240,764 | 8,703 |0.002052|0.997948
10| 4,182,815 | 8,603 |0.002057|0.997943
11| 4,116,296 | 8,603 |0.002090|0.997910
12| 4,392,760 | 7,969 |0.001814|0.998186

The column, **Rate**, gives the probability of a child experiencing a school shooting for a given grade. (**1 - Rate**) gives the probability of not experiencing a school shooting during that grade. The product of the entire **1 - Rate** column gives the probability of making it through every grade without experiencing a school shooting (98.9697%). 1 minus this probability (1.0303%, or 1 in 97) is the probability of experiencing at least one school shooting during an entire K-12 schooling at 2021 rates.
