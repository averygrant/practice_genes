SAMPLES = ['PHUM222190', 'PHUM225030', 'PHUM225970', 'PHUM226110']

rule all:
	output:
		"/scratch/practice_genes/practice_genes/allres.txt"
rule zazu:
	input: 
	      expand("/scratch/practice_genes/practice_genes/{sample}", sample=SAMPLES)
	output:
	       expand("{sample}/codeml_results.txt", sample=SAMPLES),
	       "allres.txt"
	shell:"""
	
        set +e

         for directory in {input} ; do
         cd ${{directory}} ;
	 echo 'OUTPUT FOR FILE:' {input}.fasta ${{directory}} >> /scratch/practice_genes/practice_genes/allres.txt ;
	 codeml >> /scratch/practice_genes/practice_genes/allres.txt ;
         cd .. ;
        done
 
        """
