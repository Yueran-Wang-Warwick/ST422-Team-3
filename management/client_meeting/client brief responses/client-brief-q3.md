a. How will you help us robustly defend the recommendations? Can you explain how you will conduct
checks so that we can understand the uncertainty of recommendations you make.


answer a. 
Addressing Uncertainty 1: Choice of baseline windows [AND Uncertainty 2: Min/max and distributional conclusions may be influenced by a small number of extreme years]

As addressed in the previous answer, we can consider different standard window baselines to see if the shift remains the same or not. If our current conclusions of 'sustained warming' and spring being the highest ranked season holds then our results are robust.



Addressing Uncertainty 2: Min/max and distributional conclusions may be influenced by a small number of extreme years

As mentioned in the previous answer, extremely warm years towards the end of the record can be a source of high leverage which in turn influences our extremes. To address this, we can remove the offending years from the baseline and target periods to see if these events are single-handedly driving the ranking. If our findings stay the same with Spring as the highest ranked season then we can be confident in our results.
However, additional checks can be done by using Generalized Least Squares with first order autoregression (I think this has been implemented for reference) 

Table: GLS AR(1) Baseline Shift Summary
Message: shows model-estimated recent-minus-historical shift with 95% intervals.
For baseline shift, spring has the largest modelled change, especially for maximum temperature at +1.292 degC with interval [0.871, 1.712].  
Summer and autumn shifts are also positive with intervals above zero in all three metrics.  
Winter shifts are positive in point estimate but less certain because intervals cross zero for mean, min, and max.  

Table: GLS AR(1) Long-Run Trend Summary
Message: shows model-estimated warming rate (degC per decade) with 95% intervals.
For long-run trend, all 12 season-metric combinations are positive with intervals above zero, so long-run warming is statistically robust across all seasons and metrics.


? Trimming: Set extreme values to a specific percentile (e.g., the 95th percentile) to see if the "intensifying" trend persists without the influence of absolute outliers.


b. Are any initial results fragile, say so explicitly.

answer b. I don't think we have any fragile results. but it may be difficult to address the non-climatic influences as mentioned in Uncertainty 3. 