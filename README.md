Duke DataFest 2024 – CourseKata Engagement Analysis

Predicting Student Performance & Understanding Engagement Behavior

Project Overview

This project was completed for Duke DataFest 2024 using the large-scale CourseKata educational dataset. The goal was to help CourseKata better understand patterns in student engagement, checkpoint performance, and end-of-chapter assessment scores, and to explore predictive models that could inform personalized learning recommendations.

Using R, the project performs data wrangling, visualization, and machine learning modeling to uncover insights about how students interact with digital course material and how those behaviors relate to learning outcomes.

Dataset Used

The dataset (CSV files provided by DataFest) includes:

page_views.csv – behavioral interactions on every course page

media_views.csv – views of embedded videos/media

checkpoints.csv – number of correct responses & attempts for practice items

codebook.csv – variable dictionary

items.csv, responses.csv, variable_list.csv – additional metadata and raw response behavior

Relationship between page views and checkpoints – supplemental CSV

(Large responses CSV also used but too large to upload)

These datasets were merged, filtered, and visualized to study engagement patterns and performance outcomes.


Data Fest Write-up

Methods Used
1. Data Wrangling (R / dplyr / tidyverse)

Combined page_views and media_views to measure section-level engagement

Cleaned and filtered checkpoints data

Created unified tables of engagement metrics

Identified unique chapter-level combinations

2. Visualization (ggplot2)

Bar charts for engagement across chapters

Stacked engagement-level progress plots

Plot of page views vs. correct checkpoints

Relationship insights between content type and performance

3. Statistical Testing

Permutation test to compare end-of-chapter score differences between students who answered pulse questions positively (5) vs negatively (0).

Observed difference (~-0.0633) fell outside the distribution of 1,000 randomized differences → indicating a real effect.


Data Fest Write-up

4. Machine Learning Model

Built a predictive model for end-of-chapter performance

Engagement and idleness used as predictors

Engagement had 20% importance, the strongest predictor

Predictions skewed slightly due to dataset imbalance but showed meaningful accuracy for higher-performing students


Data Fest Write-up

Key Findings
1. Engagement Levels Vary Across Chapters

Visualizing total progress showed which chapters students engaged with most vs. least. This helps CourseKata identify where additional videos, explanations, or interactive content may be needed.

2. Page Views Correlate with Checkpoint Success

Pages with higher engagement tended to have more correct checkpoint responses.
Implication: well-structured pages generate better learning outcomes.

3. Students’ Pulse Question Responses Predict Performance

Students who indicated feeling positive/confident at the start of a chapter performed statistically significantly better on end-of-chapter assessments.

4. Engagement Is the Strongest Predictor of Success

From the ML model:

Engagement = 20% variable importance

Suggests that increasing interaction frequency may improve scores

Potential for a recommendation engine suggesting pages or time allocations

 Code Overview

The full R script performs:

Loading & cleaning data


DUKE DATA FEST FINAL

Combining page and media interactions

Summarizing progress by chapter and engagement level

Producing ggplot visualizations

Joining checkpoint accuracy with engagement metrics

Building a predictive model (in later analysis not shown in uploaded R but documented in PDF)

\Plots & Visual Outputs (Described)

These appear in the report PDF and were generated in R:

Engagement Progress Bar Plot
Stacked bar showing engagement levels across chapters.

Page Views vs. Correct Checkpoints
Shows which pages produce the highest correct responses.

Permutation Test Histogram
Displays simulated differences vs. observed difference.

Prediction vs Actual Scatter
Shows model accuracy for end-of-chapter scores.


How to Run This Project
Requirements

Install the following R packages:

install.packages(c("tidyverse", "dplyr", "ggplot2"))

Running the Script

Place all CSV files in a single folder

Set your working directory at the top of the script:

setwd("YOUR/PATH/HERE")


Run the script: Place all CSV files in a single folder

Set your working directory at the top of the script:

source("DUKE DATA FEST FINAL.R")


Plots will appear in the RStudio Plots panel, and cleaned tables can be viewed in the console.

Duke-DataFest-2024/
│
├── README.md
├── DUKE DATA FEST FINAL.R
├── data/
│     ├── page_views.csv
│     ├── media_views.csv
│     ├── checkpoints.csv
│     ├── codebook.csv
│     ├── items.csv
│     ├── responses.csv (too large to upload; ss added instead)
│     ├── variable_list.csv
│     └── Relationship between page views and checkpoints.csv
│
├── output/
│     ├── engagement_plot.png
│     ├── page_vs_checkpoints.png
│     ├── permutation_histogram.png
│     └── ml_model_plots.png
│
└── Data Fest Write-up.pdf
