#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DeepT3
# 2018
# Jiesi Luo, Southwest Medical University, China
#'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'The main driver to the DeepCas9 scripts 
#'@author: ljs@swmu.edu.cn
###########################################

library(mxnet)
library(seqinr)
library(stringr)
DeepCas9_293T_model<-mx.model.load("DeepCas9_293T",iteration = 250)
DeepCas9_HL60_model<-mx.model.load("DeepCas9_HL60",iteration = 250)
DeepCas9_mEL4_model<-mx.model.load("DeepCas9_mEL4",iteration = 250)
source("encodeOntargetSeq.R")
source("DeepCas9_scores.R")
encodeOntargetSeq("input_example.txt")
DeepCas9_scores("one-hot.csv")


