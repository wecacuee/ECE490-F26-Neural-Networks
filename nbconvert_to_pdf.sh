jupyter nbconvert --to webpdf \
    --config $(dirname $0)/nbconvert_config.py \
        --output-dir build-pdf/ "$@"
