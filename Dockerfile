# Use a base image with Anaconda installed
FROM continuumio/anaconda3

# Set the working directory
WORKDIR /root/workspace

# Expose the Jupyter Notebook port
EXPOSE 8888

# Install Dependencies of Anaconda3
RUN apt-get update && \
    apt-get install -y git tmux vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a new conda environment
RUN conda create -n dogoenv python=3.9

# Install Jupyter Notebook
RUN conda install -y jupyter

# Install nbextensions
RUN conda install -y -c conda-forge jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --user

# Activate the conda environmnet
SHELL ["conda", "run", "-n", "dogoenv", "/bin/bash", "-c"]

# Some Dependencies

# Install Jupyter in the conda environment and Jupyter Setting
RUN jupyter notebook --generate-config
RUN echo -e "\
c.NotebookApp.allow_origin = '*' \n\
c.NotebookApp.allow_root = True \n\
c.NotebookApp.open_browser = False \n\
c.NotebookApp.notebook_dir = '/root/workspace/' \n\
c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py 

CMD [ "/bin/bash" ]
