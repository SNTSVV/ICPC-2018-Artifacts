
# Specify full paths to the executables of MoLFI
# each tool has two main scripts:
#     - the tool script which will apply the proposed technique ( MoLFI.py).
#     - validation.py script that will compare the generated templates against the oracle and produce too files:
#           * Validation file with correct templates and incorrect ones
#           * Metrics file with values of specific metrics that are used to evaluate each tool.
# To be updated based on the MoLFI folder on your machine
PATH_MoLFI := ../MoLFI
PYTHONPATH := $(PATH_MoLFI)

REQ_FILE = $(PATH_MoLFI)/requirements.txt
SETUP = $(PATH_MoLFI)/setup.py
# specify the path to the datasets
DATASETS = $(PWD)/Datasets
LOG_PARAM = logs-parameters.txt

# Set important Paths
MoLFI_EXEC = $(PATH_MoLFI)/MoLFI.py
MoLFI_VALID = $(PATH_MoLFI)/validation.py

# specify the output folders
OUTPUT = Experiments_Results
VALIDATION_DIR = $(OUTPUT)/Validation
METRICS_DIR = $(OUTPUT)/Metrics


targets:
	@ make init
	@ make clean_dir
	@ make create_folder
	@ make run_MoLFI

init:
	@ pip install -r $(REQ_FILE)


# delete old results from OUTPUT
clean_dir:
	@ if [ -d $(OUTPUT) ]; then \
        rm -r $(OUTPUT); else mkdir $(OUTPUT); \
    fi

# create output folders
create_folder:
	@ mkdir -p $(VALIDATION_DIR)
	@ mkdir -p $(METRICS_DIR)


# main target to run the MoLFI tool
run_MoLFI: $(check_datasets)
	@ ./runner_MoLFI.sh $(MoLFI_EXEC) $(MoLFI_VALID) $(OUTPUT) $(LOG_PARAM)
