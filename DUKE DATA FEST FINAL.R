setwd("C:/Users/Jania/OneDrive - University of North Carolina at Chapel Hill/Duke Data Fest")
rm(list=ls())
page_views<-read.csv("page_views.csv")
media_views<-read.csv("media_views.csv")
checkpoints<-read.csv("checkpoints.csv")
codebook<-read.csv('codebook.csv')
library(tidyverse)
library(dplyr)
library(ggplot2)

#Objective: Help Coursekata improve the student experience of learning statistics/ help students better use coursekata to improve/learn data science

#1) make revised tables for page views and media_views and checkpoints csv 
page_views1 <- page_views %>%
  select(book, chapter_number, section_number, engaged, review_flag, off_page_brief, off_page_long, page)

media_views1<- media_views%>%
  select(book, chapter_number, section_number,review_flag, page)

combined_media_page<- bind_rows(page_views1, media_views1)

checkpoints1<- checkpoints%>%
  select(book, chapter_number, n_correct, n_attempt)


#Engagement with Chapters and Sections:Engagement with Chapters and Sections:Visualizing the engagement with each chapter and section can provide insights into where students might be more or less engaged. This can help CourseKata identify areas that may need improvement or additional resources.

# Create a color palette for engagement levels
engagement_colors <- c("Not Engaged" = "blue", "Low Engagement" = "green", "Moderate Engagement" = "orange", "High Engagement" = "red")

# Combine data to get the total progress in each section
progress_data <- combined_media_page %>%
  group_by(book, chapter_number, engaged) %>%
  summarise(total_progress = n())

# Convert 'engaged' to factor with specified levels
progress_data$engaged <- factor(progress_data$engaged, levels = c("Not Engaged", "Low Engagement", "Moderate Engagement", "High Engagement"))

# Plot the bar plot
engagement_progress_barplot <- progress_data %>%
  ggplot(aes(x = chapter_number, y = total_progress, fill = engaged)) +
  geom_bar(stat = "identity", position = "stack", width = 0.7) +
  labs(x = "Chapter Number", y = "Total Progress", fill = "Engagement", title = "Engagement Progress in Each Chapter") +
  scale_fill_manual(values = engagement_colors) +
  theme_minimal()

# Print the plot
print(engagement_progress_barplot)




#Relationship of Page views and Checkpoints
unique_combined <- combined_media_page %>%
  distinct(book, chapter_number, .keep_all = TRUE)

# Filter unique combinations from checkpoints1
unique_checkpoints <- checkpoints1 %>%
  distinct(book, chapter_number, .keep_all = TRUE)

filtered_data <- left_join(unique_combined, unique_checkpoints, by = c("book", "chapter_number"))

page_vs_checkpoints <- filtered_data %>%
  ggplot(aes(x = page, y = n_correct, fill = engaged)) +
  geom_bar(stat = "identity") +
  labs(x = "Page", y = "Number of Correct Checkpoints", fill = "Engagement") +
  ggtitle("Relationship Between Page Views and Checkpoints") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(page_vs_checkpoints)
