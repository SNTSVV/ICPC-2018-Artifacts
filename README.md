# ICPC-2018-Artifacts
This repository contains the datasets used for the evaluation of the tool MoLFI: https://github.com/SalmaMessaoudi/MoLFI.git

- The datasets we used are publicly available and they are the same used by **He et al.** for their work:
    **An Evaluation Study on Log Parsing and Its Use in Log Mining** http://ieeexplore.ieee.org/document/7579781/

- 2 additional log files are used which are accessible from the following links:

     BGL-100K: https://www.usenix.org/cfdr-data (BlueGene/L)

     HDFS-60K: https://issues.apache.org/jira/secure/attachment/12379873/hadoop-hadoop-datanode-new.log

The Datasets folder contains the publicly available log files and their corresponding oracle files.

Each sub-folder in Datasets contains the log files and their corresponding oracles (grouped by dataset name and size).

  Two scripts exist in this repository:
  * runner_MoLFI.py: the script we used for the evaluation.
  * Makefile: we used this makefile to start the evaluation.

  To re-run the experiments (Run MoLFI 50 times on each log file), you need the source code of our tool MoLFI https://github.com/SalmaMessaoudi/MoLFI.git

  (**MoLFI_tool**):

  -> You need to put both folders (MoLFI and ICPC-2018-Artifacts) under the same directory.

  -> Ru-run experiments: check the Makefile for any required change (e.g., path to source code) then go under the folder **ICPC-2018-Artifacts** and run **make**.

  -> Under the same folder (ICPC-2018-Artifacts), a new folder will be created (Experiments_Results) with a sub-folder called "Metrics" containing the validation scores for each dataset and another sub-folder "Validation" with the generated templates being compared with the corresponding oracle.

  Note: To run the experiments but with only "n" runs, you can modify the runner_MoLFI script and specify the number of runs.
