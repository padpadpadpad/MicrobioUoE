<!-- README.md is generated from README.Rmd. Please edit that file -->
MicrobioUoE
===========

MicrobioUoE is an R package built to allow sharing of R code and functions between the lab groups of Angus Buckling and Edze Westra. As we do very similar analyses and use similar code, this should act as an easy way to share R code.

For problems and suggestions please email Daniel Padfield <_d.padfield@exeter.ac.uk>\_

### Installation

Installation of packages from GitHub is relatively straightforward.

``` r
# firstly need to make sure devtools is installed
install.packages('devtools')

# install MicrobioUoE
devtools::install_github('padpadpadpad/MicrobioUoE')
```

### Functions

-   stock\_sol\_vol()
    -   calculates the amount of volume needed to dilute a stock solution to a required concentration and volume

``` r
MicrobioUoE::stock_sol_vol(stock_sol_conc = 0.75, new_sol_conc = 0.2, new_sol_vol = 1000)
#> [1] 266.6667
```

-   calc\_norm\_OD()
    -   takes an csv of OD readings and writes another csv of the required volumes to normalise the concentrations across samples

``` r
MicrobioUoE::calc_norm_OD('first_OD_readings.csv', 
                          'df_volumes.csv', 
                          new_sol_conc = 0.1,
                          new_sol_vol = 1000,
                          control = 0.035)
```

-   moveRmdOutput()
    -   Automatically moves .Rmd Output files into a separate folder after rendering. Just need to specify the Rmarkdown folder and the Output folder

``` r
MicrobioUoE::moveRmdOutput('~/Desktop/My_experiment/Rmd_path', '~/Desktop/My_experiment/Output_path')
```

-   package\_install\_all()
    -   Allows the installation of packages from CRAN, GitHub and Bioconductor at the same time. This is useful when you are starting a new analysis and already have a list of packages you need to use.

``` r
cran_packages <- c('dplyr', 'ggplot2', 'tidyr')
github_packages <- c('padpadpadpad/nlsLoop')
bioc_packages <- c('phangorn')

MicrobioUoE::package_install_all(cran_packages, github_packages, bioc_packages)
#> Downloading GitHub repo padpadpadpad/nlsLoop@master
#> from URL https://api.github.com/repos/padpadpadpad/nlsLoop/zipball/master
#> Installing nlsLoop
#> '/Library/Frameworks/R.framework/Resources/bin/R' --no-site-file  \
#>   --no-environ --no-save --no-restore --quiet CMD INSTALL  \
#>   '/private/var/folders/bw/019yc5_138qdgk1xsbz3l99r0000gn/T/RtmpS6IoMv/devtools658e7249042b/padpadpadpad-nlsLoop-9508a1f'  \
#>   --library='/Library/Frameworks/R.framework/Versions/3.4/Resources/library'  \
#>   --install-tests
#> 
#> [1] "Huzzah all the packages are installed"
```

### Suggestions for functions

If you have a piece of code you use regularly or a set of functions you use all the time and would like to integrate those into this package for others to use as well, please email at the address above or comment on the [Issues tab](https://github.com/padpadpadpad/MicrobioUoE/issues).

Alternatively come find me for a chat about how I can help.
