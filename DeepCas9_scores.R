#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DeepCas9
# 2018
# Jiesi Luo, Southwest Medical University, China
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' DeepCas9_scores
#'
#'
#' DeepCas9_scores: predict the CRISPR sgRNA activity using the deep 
#' convolutional neural network.
#' 
#'
#'
#' @usage DeepCas9_scores(FileName)
#'
#' @param FileName A character name of the "one-hot" matrix file
#'
#' @return result_ontarget.csv A file containing four activity scores, 
#' including DeepCas9_HL60_score, DeepCas9_mEL4_score, DeepCas9_
#' 293T_score and DeepCas9_score.
#' 
#' @examples
#' DeepCas9_scores("one-hot.csv")
#' @export DeepCas9_result.csv
#'
#' @author Jiesi Luo

###########################################################################


DeepCas9_scores<-function(FileName) {
  
        test<-read.csv(FileName)

        test_onehot<-t(test[,-1])
  
        test_sequences<-as.character(test[,1])

        dim(test_onehot)<-c(4,30,1,ncol(test_onehot))

        DeepCas9_HL60_score<-predict(DeepCas9_HL60_model,test_onehot)
 
        DeepCas9_mEL4_score<-predict(DeepCas9_mEL4_model,test_onehot)

        DeepCas9_293T_score<-predict(DeepCas9_293T_model,test_onehot)

        DeepCas9_score<-DeepCas9_mEL4_score*0.2+DeepCas9_293T_score*0.3+DeepCas9_HL60_score*0.5

       result_DeepCas9<-rbind(test_sequences,DeepCas9_HL60_score, DeepCas9_mEL4_score, DeepCas9_293T_score,DeepCas9_score)

       rownames(result_DeepCas9)<-c("test_sequences","DeepCas9_HL60_score", "DeepCas9_mEL4_score","DeepCas9_293T_score","DeepCas9_score")

 write.csv(t(result_DeepCas9),file="DeepCas9_result.csv")
    
 }











          


     
