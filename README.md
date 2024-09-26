# AirFare
This project performs a comprehensive analysis of airfare data to predict ticket prices based on various features such as distance, population, income, and airline competition. The aim is to derive business insights that can assist airlines in strategic decision-making.
Project Overview
The project utilizes linear regression modeling to understand the factors affecting airfare prices. A backward elimination approach is used to refine the model, reducing the number of variables while maintaining high predictive accuracy.

Key Objectives:
Develop a linear regression model to predict airfare prices.
Perform backward selection to improve the model's performance.
Analyze the impact of different variables on airfare.
Dataset
The dataset used in this analysis contains information on various factors influencing airfare, such as:

FARE: The airfare in dollars.
COUPON: The number of coupons (or legs) in the ticket.
NEW: Indicates if the airline is new in the market.
HI: Herfindahl index, a measure of market concentration.
S_INCOME & E_INCOME: Starting and ending city per capita incomes.
S_POP & E_POP: Starting and ending city populations.
DISTANCE: Distance between starting and ending cities.
PAX: Number of passengers.
VACATION_YES: Indicates if the route is commonly used for vacation.
SW_YES: Indicates if Southwest Airlines serves the route.
SLOT_CTRL & GATE_CONS: Slot and gate control data.
Analysis and Results
Model Building
Initial Linear Regression Model:

Includes 13 variables impacting airfare.
Achieved an Adjusted R² of 0.7911 with an RMSE of 37.60.
Backward Selection:

Removed non-significant variables.
Final model includes 11 variables.
Achieved an Adjusted R² of 0.7910 with an RMSE of 37.45.
Model Interpretation
Key findings from the regression analysis:

SW_YES (-45.32): If Southwest Airlines serves the route, average fares decrease significantly.
DISTANCE (0.08142): Longer distances generally increase fare prices.
VACATION_YES (-34.19): Vacation routes have lower prices, likely due to promotional strategies.
Business Insights
Competitive Pricing:

Lower fares in competitive markets with a high Herfindahl Index to attract customers.
Increase fares on less competitive routes to maximize revenue.
Promotional Strategies:

Offer promotional fares on vacation routes to boost demand.
Set higher prices for high-income areas reflecting greater willingness to pay.
Airline Presence:

Leverage the presence of low-cost carriers like Southwest to competitively price routes.
Use SLOT and GATE data to adjust pricing based on congestion.
Conclusion
The backward selection model effectively reduces variables while maintaining predictive power. The analysis suggests strategic pricing adjustments based on market competitiveness and demographic factors.
