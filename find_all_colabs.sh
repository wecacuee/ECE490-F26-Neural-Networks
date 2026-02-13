find notebooks/ -name '*Colab.ipynb' ! \( -path '*.ipynb_checkpoints*' \) -exec $1 \{} \;
