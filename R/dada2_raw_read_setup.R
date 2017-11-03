#' dada2_raw_read_setup
#'
#' Function to setup the workspace for the AB_dada2_pipeline
#'
#' @param packages list of packages to load in. Defaults to \code{dada2}, \code{MicrobioUoE}, \code{ggplot2}, \code{tidyr}, \code{dplyr}, \code{phyloseq}, \code{DECIPHER}
#' @param raw_path the path to where the raw fastq files are. Defaults to \code{data/raw_fastq}
#' @param filt_path the path to where the filtered fastq files should be put. Defaults to \code{data/filtered_fastq}
#' @param plot_path path to where the plots will be saved. Defaults to \code{plots}
#' @param output_path path to where output will be saved. Defaults to \code{data/output}
#' @param progress_path path to where progress files will be saved. Defaults to \code{data/progress}
#' @param ref_fasta path to reference fasta file for taxonomic assignment. Defaults to \code{data/ref_trainsets/rdp_train_set_16.fa}
#' @param ref_fasta_spp path to reference fasta file for species assignment. Defaults to \code{data/ref_trainsets/rdp_species_assignment_16.fa}
#' @param meta_data path to metadata file. Defaults to \code{data/metadata.csv}
#' @param fwd_error path to forward error rate if previously estimated. Ignores by default
#' @param rev_error path to reverse error rate if previously estimated. Ignores by default
#' @param run_filter whether or not to run the filtering step. Defaults to 'Y' for yes.
#' @author Daniel Padfield
#' @details sets up the environment at the beginning of \code{raw_read_processing.R} and \code{big_data_processing.R} so that the scripts run well. Assigns all the necessary paths and loads in necessary packages and data
#' @return a bunch of paths and creates the necessary folders to make sure the environment is prepared for running the dada2 pipeline
#' @name dada2_raw_read_setup
#' @export dada2_raw_read_setup
dada2_raw_read_setup <- function(packages = c('ggplot2', 'dada2', 'phyloseq', 'DECIPHER', 'tidyr', 'dplyr', 'MicrobioUoE'),
                                 raw_path = 'data/raw_fastq',
                                 filt_path = 'data/filtered_fastq',
                                 plot_path = 'plots',
                                 output_path = 'data/output',
                                 progress_path = 'data/progress',
                                 ref_fasta = 'data/ref_trainsets/rdp_train_set_16.fa',
                                 ref_fasta_spp = 'data/ref_trainsets/rdp_species_assignment_16.fa',
                                 meta_data = 'data/metadata.csv',
                                 fwd_error = NULL,
                                 rev_error = NULL,
                                 run_filter = 'Y'){

  if(any(packages %in% utils::installed.packages()) == FALSE)
    {
    pkgs_not_pres <- packages[! packages %in% utils::installed.packages()]
    stop(paste("Some of the packages are currently not installed. Please install them before running this function again. Packages not present are:", paste(pkgs_not_pres, collapse = ' '), sep = ' '),
           call. = FALSE)
    }

  # load in packages
  lapply(packages, library, character.only = TRUE)

  # assign things to global environment
  assign('raw_path', raw_path, envir = globalenv())
  assign('filt_path', filt_path, envir = globalenv())
  assign('run_filter', run_filter, envir = globalenv())
  if(!is.null(fwd_error)){assign('fwd_error', readRDS(fwd_error), envir = globalenv())}
  if(!is.null(rev_error)){assign('rev_error', readRDS(rev_error), envir = globalenv())}
  assign('output_path', output_path, envir = globalenv())
  assign('ref_fasta', ref_fasta, envir = globalenv())
  assign('ref_fasta_spp', ref_fasta_spp, envir = globalenv())

  # create folders and progress file

  # make time an internal object
  time <- format(Sys.time(), '%Y%m%d_%H:%M_')

  # create progress file
  file.create(paste(progress_path, '/', time, 'progress.txt', sep = ''))
  assign('progress_file', paste(progress_path, '/', time, 'progress.txt', sep = ''), envir = globalenv())
  writeLines(paste('Run started at ', Sys.time()), progress_file)

  dir.create(file.path(plot_path, substr(time, 1, nchar(time) - 1)))
  assign('plot_path', file.path(plot_path, substr(time, 1, nchar(time) - 1)), envir = globalenv())
  dir.create(file.path(output_path, substr(time, 1, nchar(time) - 1)))
  assign('output_path', file.path(output_path, substr(time, 1, nchar(time) - 1)), envir = globalenv())

  # load in metadata file
  assign('meta', utils::read.csv(meta_data, stringsAsFactors = FALSE), envir = globalenv())
}
