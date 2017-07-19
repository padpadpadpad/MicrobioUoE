<!-- README.md is generated from README.Rmd. Please edit that file -->
MicrobioUoE
===========

MicrobioUoE is an R package built to allow sharing of R code and functions between the lab groups of Angus Buckling and Edze Westra. As we do very similar analyses and use similar code, this should act as an easy way to share R code.

For problems and suggestions please email Daniel Padfield *<d.padfield@exeter.ac.uk>*

### Installation

Installation of packages from GitHub is relatively straightforward.

``` r
# firstly need to make sure devtools is installed
install.packages('devtools')

# install MicrobioUoE
devtools::install_github('padpadpadpad/MicrobioUoE')
```

### Functions

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
#> Skipping install of 'nlsLoop' from a github remote, the SHA1 (9508a1fe) has not changed since last install.
#>   Use `force = TRUE` to force installation
#> [1] "Huzzah all the packages are installed"
```

### Suggestions for functions

If you have a piece of code you use regularly or a set of functions you use all the time and would like to integrate those into this package for others to use as well, please email at the address above or comment on the [Issues tab](https://github.com/padpadpadpad/MicrobioUoE/issues).

Alternatively come find me for a chat about how I can help.
