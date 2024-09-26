#A Load the dataset
airfares.df <- read.csv(file.choose())

# Remove "$" from FARE and convert it to numeric
airfares.df$FARE <- as.numeric(gsub("\\$", "", airfares.df$FARE))
dim(airfares.df)
names(airfares.df)
# Partition the dataset
set.seed(123)
train.in <- sample(1:nrow(airfares.df), 0.6 * nrow(airfares.df))
train.df <- airfares.df[train.in, ]
valid.df <- airfares.df[-train.in, ]

#B Build the linear regression model
model.lin <- lm(FARE ~ COUPON + NEW + HI + S_INCOME + E_INCOME + S_POP + E_POP + DISTANCE + PAX + 
                  VACATION_YES + SW_YES + SLOT_CTRL + GATE_CONS, data = train.df)

# Summary of the model
summary(model.lin)
#C Based on the regression output , the linear regression equation for predicting FARE can be written as follows:

#FARE=[42.79]−[20.44]×COUPON−[4.67]×NEW+[0.007]×HI+[0.000444]×S_INCOME+[0.00118]×E_INCOME+[0.000003399]×S_POP+[0.000003669]×E_POP+[0.08142]×DISTANCE−[0.001004]×PAX−[34.19]×VACATION_YES−[45.32]×SW_YES+[17.34]×SLOT_CTRL+[23.17]×GATE_CONS
#Interpretation of Coefficients
#SW_YES = -45.32 means:
# If Southwest Airlines serves the route meaning SW_YES = 1, the average fare decreases by $45.32 compared to routes where Southwest does not operate means SW_YES = 0.
#This suggests that Southwest's presence is strongly associated with lower airfare due to its low-cost business model.
#DISTANCE = 0.08142 means:
#For each additional mile of distance between the starting and ending cities, the fare increases by $0.08142.
#This means that longer routes generally lead to higher airfares
#d Backward selection
model.backward <- step(model.lin, direction = "backward")

# Summary of the backward model
summary(model.backward)

#Total Number of Selected Variables: 11
#Estimation Result
#FARE=[32.24]−[4.38]×NEW+[0.00750]×HI+[0.001117]×E_INCOME+[0.000003641]×S_POP+[0.000003361]×E_POP+[0.07726]×DISTANCE−[0.0008766]×PAX−[34.90]×VACATION_YES−[46.23]×SW_YES+[17.35]×SLOT_CTRL+[23.06]×GATE_CONS
# Predict on validation data
lin.pred <- predict(model.lin, valid.df)
backward.pred <- predict(model.backward, valid.df)
# Calculate RMSE for both models
install.packages("Metrics")
library(Metrics)
#rmse needs to be lower
rmse.lin <- rmse(valid.df$FARE, lin.pred)
rmse.backward <- rmse(valid.df$FARE, backward.pred)

# Compare Adjusted R² values
adj_r2_lin <- summary(model.lin)$adj.r.squared
adj_r2_backward <- summary(model.backward)$adj.r.squared
#want lower rmse
#higher adjusent
# Print results
cat("Full Model RMSE:", rmse.lin, "\n")
cat("Backward Model RMSE:", rmse.backward, "\n")
cat("Full Model Adjusted R²:", adj_r2_lin, "\n")
cat("Backward Model Adjusted R²:", adj_r2_backward, "\n")
#as backward model has lower adjusent it is comparibly better
#suggesions:
# Should lower fares in competitive markets (low HI) to attract customers;
#higher fares in less competitive markets.
#The significant negative coefficient for VACATION_YES indicates lower pricing for vacation routes can boost demand.
#Consider promotional fares to attract more travelers to these destinations.
#Set higher fares for routes connecting to high-income areas, reflecting greater willingness to pay.
#Use SLOT_CTRL and GATE_CONS data to price accordingly; 
#higher fares for congested routes may yield more revenue due to increased demand.
