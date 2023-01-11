# Classification-in-R

Competitive Auctions on eBay.com. The file eBayAuctions.csv contains information on 1972 auctions that transacted on eBay.com during May–June 2004. The goal
is to use these data to build a model that will classify auctions as competitive or noncompetitive. A competitive auction is defined as an auction with at least two bids placed
on the item auctioned. The data include variables that describe the item (auction category), the seller (his/her eBay rating), and the auction terms that the seller selected
(auction duration, opening price, currency, day-of-week of auction close). In addition, we have the price at which the auction closed. The task is to predict whether or
not the auction will be competitive.
Data Preprocessing. Convert variable Duration into a categorical variable. Split the
data into training (60%) and validation (40%) datasets.

a. Fit a classification tree using all predictors, using the best-pruned tree. To avoid
overfitting, set the minimum number of records in a terminal node to 50 (in R:
minbucket = 50). Also, set the maximum number of levels to be displayed at seven
(in R: maxdepth = 7).Write down the results in terms of rules. (Note: If you had to
slightly reduce the number of predictors due to software limitations, or for clarity
of presentation, which would be a good variable to choose?)
Answer- 
•	If (open price <1.8) and (close price <1.2) then class=0 (non-competitive auction). 
•	If (open price <1.8) and (close price >1.2) then class=1 (competitive auction). 
•	If (open price > =1.8) and (close price <12) and (open price > =4.9) then class=0(non-competitive auction)


b. Is this model practical for predicting the outcome of a new auction?
Answer -
The model is not practical for predicting the outcomes because it uses close price to find whether the auction is competitive or not. As close price is not available at the start of the auction, we cannot use it. Moreover, the accuracy of model is around 80 percent which is not enough for a good model

c. Describe the interesting and uninteresting information that these rules provide.
Answer- 
The interesting information is that the model mostly depends on the open price and close price of the auction. They are used at different levels to make the rules. The uninteresting fact is that the close price won’t be available at the start of the auction, but the competitive variable is highly dependent on close price.

d. Fit another classification tree (using the best-pruned tree, with a minimum number
of records per terminal node = 50 and maximum allowed number of displayed levels
= 7), this time only with predictors that can be used for predicting the outcome of
a new auction. Describe the resulting tree in terms of rules. Make sure to report
the smallest set of rules required for classification.
Answer-
•	If (open price <3.7) and (close price >=3.6) then class=1 (competitive auction). 
•	If (open price>=3.7) and (close price <10) then class=0 (non-competitive auction). 
•	If (open price > =3.7) and (close price >=10) and (open price <11) then class=1(competitive auction)

e. Plot the resulting tree on a scatter plot: Use the two axes for the two best (quantitative) predictors. Each auction will appear as a point, with coordinates corresponding to its values on those two predictors. Use different colors or symbols
to separate competitive and noncompetitive auctions. Draw lines (you can sketch
these by hand or use R) at the values that create splits.
