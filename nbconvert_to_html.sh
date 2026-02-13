jupyter nbconvert --to html --theme jupyterlab-theme-githublight \
    --config $(dirname $0)/nbconvert_config.py \
        --output-dir build-html/ "$@"
