#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DeepCas9
# 2018
# Jiesi Luo, Southwest Medical University, China
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' encodeOntargetSeq
#'
#' encodeOntargetSeq: convert spCas9 30 bp target sequence (4 bp + 20 
#' bp protospacer + PAM + 3 bp) into a one-hot matrix with 4 rows and 
#' 30 columns. The four rows corresponds to the four nucleotide A, G, 
#' T and C. The output file ("one-hot.csv") of this function can be used
#' directly for DeepCas9 function.
#'
#'
#'
#'
#' @usage encodeOntargetSeq(FileName)
#'
#' @param FileName A character name of the 30 bp target sequence fasta 
#' format file, including full path of file if it is located outside the 
#' current working directory.
#'
#' @return one-hot.csv A matrix containing encoded features. Sequence
#' features are represented as binary numbers.
#'
#' @examples
#' encodeOntargetSeq("textsequence.txt")
#' @export one-hot.csv
#'
#' @author Jiesi Luo

###########################################################################

encodeOntargetSeq<-function(FileName) {
      
     DNAsequence<-read.fasta(FileName,seqtype=c("DNA"),as.string=TRUE,
                          forceDNAtolower=FALSE,seqonly=TRUE)

     one_hot<-diag(1,4,4)
  
     nuc_type<-c("A","T","C","G")

     test<-vector()

     for (num in 1:length(DNAsequence)) {

          mononucleotide<-substring(DNAsequence[num],1:30,1:30)

            for(nuc in 1:4) {
             
              mononucleotide<-str_replace_all(mononucleotide,nuc_type[nuc],str_c(as.character(one_hot[nuc,]),collapse=""))
               }
     test[num]<-str_split(str_c(mononucleotide,collapse =""),"")
       }
    test_array <-t(do.call(rbind,test))

    output<-rbind(DNAsequence,test_array)
    
    write.csv(t(output),file="one-hot.csv",row.names=FALSE)

}

