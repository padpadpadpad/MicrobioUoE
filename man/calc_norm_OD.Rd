% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calc_norm_OD.R
\name{calc_norm_OD}
\alias{calc_norm_OD}
\title{calc_norm_OD}
\arguments{
\item{file_in}{the filename of the file containing the initial OD readings}

\item{file_out}{the filename of the file you want to write to. This defaults to appending '_inocs' onto the `file_in` name}

\item{new_sol_conc}{the desired final concentration of the solution. Defaults to 0.1.}

\item{new_sol_vol}{the volume of the final solution. Defaults to 1000.}

\item{control}{the value of the control on the OD reader. Defaults to 0}
}
\value{
Saves a file with the reuqired inoculum values to normalise OD at a given final volume.
}
\description{
Calculates the volumes needed for a set of OD readings to normalise OD across samples
}
\details{
Relies on having a column called OD which contains the initial OD values
}
\examples{
\dontrun{calc_norm_OD(file_in = 'OD_start.csv',
file_out = 'OD_inocs.csv',
new_sol_conc = 0.1,
new_sol_vol = 1000,
control = 0.035)}
}
\author{
Daniel Padfield
}
