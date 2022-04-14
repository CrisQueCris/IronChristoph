![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Hypothesis Testing


### Instructions

1. It is assumed that the mean systolic blood pressure is `μ = 120 mm Hg`. In the Honolulu Heart Study, a sample of `n = 100` people had an average systolic blood pressure of 130.1 mm Hg with a standard deviation of 21.21 mm Hg. Is the group significantly different (with respect to systolic blood pressure!) from the regular population?

   - Set up the hypothesis test.
   - Write down all the steps followed for setting up the test.
   - Calculate the test statistic by hand and also code it in Python. It should be 4.76190. What decision can you make based on this calculated value?

mu = 120 
n = 100
sample mean = 130.1
std = 21.21

Ho: The sample mean of 130,1 mm is not significantly higher than the population mean of 120 mm HG.


H0: mu = 120

Ha: mu != 120


Statistic: (130.1 - 120)/ (21.21/sqrd(100)
        t = 10,1 /2,121
        t= 4,762
        
        tc (0,975, 100)= 1,984 < t = 4,762
        
        
        Confidence intervall: 
        
 We can reject the Nullhypothesis: The group really has a higher blood preasure than the mena population. 
 
 
        












### On Friday
2. In a packing plant, a machine packs cartons with jars. It is supposed that a new machine will pack faster on the average than the machine currently used. To test that hypothesis, the times it takes each machine to pack ten cartons are recorded. The results, in seconds, are shown in the tables in the file `Data/machine.txt`. Assume that there is sufficient evidence to conduct the t test, does the data provide sufficient evidence to show if one machine is better than the other
