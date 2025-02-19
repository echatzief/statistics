% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EDA.R
\name{eda_report}
\alias{eda_report}
\alias{eda_report.data.frame}
\title{Reporting the information of EDA}
\usage{
eda_report(.data, ...)

\method{eda_report}{data.frame}(
  .data,
  target = NULL,
  output_format = c("pdf", "html"),
  output_file = NULL,
  output_dir = tempdir(),
  font_family = NULL,
  browse = TRUE,
  ...
)
}
\arguments{
\item{.data}{a data.frame or a \code{\link{tbl_df}}.}

\item{...}{arguments to be passed to methods.}

\item{target}{target variable.}

\item{output_format}{report output type. Choose either "pdf" and "html".
"pdf" create pdf file by knitr::knit().
"html" create html file by rmarkdown::render().}

\item{output_file}{name of generated file. default is NULL.}

\item{output_dir}{name of directory to generate report file. default is tempdir().}

\item{font_family}{charcter. font family name for figure in pdf.}

\item{browse}{logical. choose whether to output the report results to the browser.}
}
\description{
The eda_report() report the information of Exploratory
data analysis for object inheriting from data.frame.
}
\details{
Generate generalized data EDA reports automatically.
You can choose to output to pdf and html files.
This is useful for EDA a data frame with a large number of variables
than data with a small number of variables.
For pdf output, Korean Gothic font must be installed in Korean operating system.
}
\section{Reported information}{

The EDA process will report the following information:

\itemize{
  \item Introduction
  \itemize{
    \item Information of Dataset
    \item Information of Variables
    \item About EDA Report
  }
  \item Univariate Analysis
  \itemize{
    \item Descriptive Statistics
    \item Normality Test of Numerical Variables
    \itemize{
      \item Statistics and Visualization of (Sample) Data
    }
  }
  \item Relationship Between Variables
  \itemize{
    \item Correlation Coefficient
    \itemize{
      \item Correlation Coefficient by Variable Combination
      \item Correlation Plot of Numerical Variables
    }
  }
  \item Target based Analysis
  \itemize{
    \item Gruoped Descriptive Statistics
    \itemize{
      \item Gruoped Numerical Variables
      \item Gruoped Categorical Variables
    }
    \item Gruoped Relationship Between Variables
    \itemize{
      \item Grouped Correlation Coefficient
      \item Grouped Correlation Plot of Numerical Variables
    }
  }
}

See vignette("EDA") for an introduction to these concepts.
}

\examples{
\donttest{
library(dplyr)

# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

## target variable is categorical variable
# reporting the EDA information
# create pdf file. file name is EDA_Report.pdf
eda_report(carseats, US)

# create pdf file. file name is EDA.pdf
eda_report(carseats, "US", output_file = "EDA.pdf")

# create pdf file. file name is EDA.pdf and not browse
eda_report(carseats, "US", output_dir = ".", output_file = "EDA.pdf", browse = FALSE)

# create html file. file name is EDA_Report.html
eda_report(carseats, "US", output_format = "html")

# create html file. file name is EDA.html
eda_report(carseats, US, output_format = "html", output_file = "EDA.html")


## target variable is numerical variable
# reporting the EDA information
eda_report(carseats, Sales)

# create pdf file. file name is EDA2.pdf
eda_report(carseats, "Sales", output_file = "EDA2.pdf")

# create html file. file name is EDA_Report.html
eda_report(carseats, "Sales", output_format = "html")

# create html file. file name is EDA2.html
eda_report(carseats, Sales, output_format = "html", output_file = "EDA2.html")

## target variable is null
# reporting the EDA information
eda_report(carseats)


# create pdf file. file name is EDA2.pdf
eda_report(carseats, output_file = "EDA2.pdf")

# create html file. file name is EDA_Report.html
eda_report(carseats, output_format = "html")

# create html file. file name is EDA2.html
eda_report(carseats, output_format = "html", output_file = "EDA2.html")
}

}
