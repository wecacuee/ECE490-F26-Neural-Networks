QUIZ_MDS := $(wildcard notebooks/*/quiz_*.md)
QUIZ_ZIPS := $(QUIZ_MDS:.md=.zip)

all: build-html/00-LinearModels\ Colab.html \
	build-pdf/00-LinearModels\ Colab.pdf \
	build-html/02-PlaneFitProblem\ Colab.html \
	build-html/Practice\ Problems\ Bank.html \
	build-html/Practice\ Problems\ Bank.pdf \
	$(QUIZ_ZIPS)

notebooks/020-linear-models/exports/00-LinearModels\ Colab.ipynb: notebooks/020-linear-models/00-LinearModels.ipynb
	python3 scripts/export_ipynb_to_colab.py $<

notebooks/020-linear-models/exports/02-PlaneFitProblem\ Colab.ipynb: notebooks/020-linear-models/02-PlaneFitProblem.ipynb
	python3 scripts/export_ipynb_to_colab.py $<

build-html/00-LinearModels\ Colab.html: notebooks/020-linear-models/exports/00-LinearModels\ Colab.ipynb
	jupyter nbconvert --debug  --verbose DEBUG --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir build-html/ "$<"

build-html/02-PlaneFitProblem\ Colab.html: notebooks/020-linear-models/exports/02-PlaneFitProblem\ Colab.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir build-html/ "$<"

build-html/00-LinearModels\ Colab.pdf: notebooks/020-linear-models/exports/00-LinearModels\ Colab.ipynb
	jupyter nbconvert --to webpdf --embed-images  \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir build-pdf/ "$<"


build-html/Practice\ Problems\ Bank.html: notebooks/040-review/Practice\ Problems\ Bank.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir build-html/ "$<"

build-html/Practice\ Problems\ Bank.pdf: notebooks/040-review/Practice\ Problems\ Bank.ipynb
	jupyter nbconvert --to webpdf --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir build-html/ "$<"

%.zip: %.md
	text2qti --template=brightspace $<
