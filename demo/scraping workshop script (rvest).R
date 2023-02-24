##############################################
#' Description: A script demonstrating simple
#' web scraping tasks using the rvest package.
#' Author: Kristin Yeager
#' Date: 2023-02-24
#############################################

# Install the rvest package (only needed if using for the first time)
install.packages("rvest")

#' Load the rvest package
library("rvest")

#' URL of content we want to scrape
myurl <- "https://www.clevelandart.org/art/2004.30.b"

#' Download a copy of the HTML locally
download.file(url=myurl,
              destfile="2004.30.b.html")

#' Ingest the HTML of the page of interest from the web
myhtml <- rvest::read_html("2004.30.b.html")

## Example 1: Target all paragraphs on the page ###########

#' Extract all paragraph elements on the page
myparagraphs <- rvest::html_elements(myhtml, "p")
print(myparagraphs)

#' Extract the text of all paragraph elements on the page
myparagraphs_text <- rvest::html_text(myparagraphs)
print(myparagraphs_text)

## Example 2: Target paragraph(s) with a specific CSS class

#' Extract paragraph elements with the CSS class `field-name-field-artist-origin`
myspecialparagraph <- rvest::html_elements(myhtml, "p.field-name-field-artist-origin")
print(myspecialparagraph)

#' Extract the text within this special paragraph element
myspecialparagraph_text <- rvest::html_text(myspecialparagraph)
print(myspecialparagraph_text)

df <- data.frame()
