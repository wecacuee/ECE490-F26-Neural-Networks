MINICONDA_ROOT_PATH=${HOME}/.local/miniconda3
eval "$(~/.local/miniconda3/bin/conda shell.bash hook)"
conda create -c ece490 -c conda-forge
pip3 install -r requirements.txt
cd ../jupyterlab-accessible-themes/ && \
    { pip3 install -e . && \
    jupyter labextension develop . --overwrite && \
    jlpm run build; } ; cd -

GITHUBLIGHT_THEME_PATH=$MINICONDA_ROOT_PATH/envs/ece490/share/jupyter/labextensions/@jupyterlab-accessible-themes/jupyterlab-theme-githublight
rm $GITHUBLIGHT_THEME_PATH
cp -r ../jupyterlab-accessible-themes/jupyterlab_accessible_themes/labextensions/githublight $GITHUBLIGHT_THEME_PATH

