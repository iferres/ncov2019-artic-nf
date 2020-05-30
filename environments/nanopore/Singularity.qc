Bootstrap: docker
From: continuumio/miniconda3:latest

%labels
	authors="Ignacio Ferrés" 
	description="Singularity image containing all requirements for the QC of ARTIC project's ncov2019 pipeline, implemented by connorlab as a nextflow."
%files
	bin/qc.py /usr/local/bin/qc.py
	environments/qc.yml /opt/qc.yml

%post
	apt-get update && apt-get install -y curl g++ make && apt-get clean -y
	/opt/conda/bin/conda env update -f /opt/qc.yml -n base
	/opt/conda/bin/conda clean -a

