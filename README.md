DeepCas9
=========================
DeepCas9 is a deep learning model for CRISPR sgRNAs activity prediction


Author
=========================
ljs@swmu.edu.cn


Overview
=========================
DeepCas9 tool can be used to make CRISPR sgRNAs activity prediction based on convolutions neural networks and a one-hot representation of DNA sequence.
At a high level, the tool consists of (a) a one-hot vector representation for raw DNA sequence of 30 nucleotide acids, (b) three training models to learn weights to the classifier. (c) an inference model to make prediction new proteins.


Usage
=========================
The DeepCas9 is performed running the script "main.R". This is a minimal example: source("main.R"). The default test file is "input_example.txt". To run it on other test files, please change the filename parameter in the encodeOntargetSeq function in the "main.R" file.

R function and file
=========================

main: The main driver to the DeepCas9 scripts 

encodeOntargetSeq: convert spCas9 30 bp target sequence (4 bp + 20 bp protospacer + PAM + 3 bp) into a one-hot matrix with 4 rows and 30 columns. The four rows corresponds to the four nucleotide A, G, T and C. The output file ("one-hot.csv") of this function can be used directly for DeepCas9 function.

DeepCas9_scores: predict the CRISPR sgRNA activity using the deep convolutional neural network.


Requirements
=========================

The latest (devel) version of DeepCas9 requires£º 

R 3.3.3
mxnet 0.9.4
seqinr 3.4-5
stringr 1.2.0

Installation
=========================
cran <- getOption("repos")
cran["dmlc"] <- "https://s3-us-west-2.amazonaws.com/apache-mxnet/R/CRAN/"
options(repos = cran)
install.packages("mxnet")


Reference
=========================
Reference: Li Xue et al. Prediction of CRISPR sgRNA activity using a deep convolutional neural network.


 