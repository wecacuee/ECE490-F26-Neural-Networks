QUIZ_MDS := $(wildcard notebooks/*/quiz_*.md)
QUIZ_ZIPS := $(QUIZ_MDS:.md=.zip)

all: build-html/00-LinearModelsColab.html \
	build-pdf/00-LinearModelsColab.pdf \
	build-html/02-PlaneFitProblemColab.html \
	build-html/Practice\ Problems\ Bank.html \
	build-pdf/Practice\ Problems\ Bank.pdf \
	build-html/10-ContinuousOptimization.html \
	build-pdf/10-ContinuousOptimization.pdf \
	build-html/40-Perceptron3.html \
	build-pdf/40-Perceptron3.pdf \
	$(QUIZ_ZIPS)

notebooks/020-linear-models/exports/10-ContinuousOptimizationColab.ipynb: notebooks/020-linear-models/10-ContinuousOptimization.ipynb
	python3 scripts/export_ipynb_to_colab.py $<

notebooks/020-linear-models/exports/40-Perceptron3Colab.ipynb: notebooks/020-linear-models/40-Perceptron3.ipynb
	python3 scripts/export_ipynb_to_colab.py $<

notebooks/020-linear-models/exports/00-LinearModelsColab.ipynb: notebooks/020-linear-models/00-LinearModels.ipynb
	python3 scripts/export_ipynb_to_colab.py $<

notebooks/020-linear-models/exports/02-PlaneFitProblemColab.ipynb: notebooks/020-linear-models/02-PlaneFitProblem.ipynb
	python3 scripts/export_ipynb_to_colab.py $<

build-html/10-ContinuousOptimization.html: notebooks/020-linear-models/exports/10-ContinuousOptimizationColab.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" "$<"

build-pdf/10-ContinuousOptimization.pdf: notebooks/020-linear-models/exports/10-ContinuousOptimizationColab.ipynb
	jupyter nbconvert --to webpdf --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" "$<"

build-html/40-Perceptron3.html: notebooks/020-linear-models/exports/40-Perceptron3Colab.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" "$<"

build-pdf/40-Perceptron3.pdf: notebooks/020-linear-models/exports/40-Perceptron3Colab.ipynb
	jupyter nbconvert --to webpdf --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" "$<"

build-html/00-LinearModelsColab.html: notebooks/020-linear-models/exports/00-LinearModelsColab.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" "$<"

build-html/02-PlaneFitProblemColab.html: notebooks/020-linear-models/exports/02-PlaneFitProblemColab.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" "$<"

build-pdf/00-LinearModelsColab.pdf: notebooks/020-linear-models/exports/00-LinearModelsColab.ipynb
	jupyter nbconvert --to webpdf --embed-images  \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" "$<"


build-html/Practice\ Problems\ Bank.html: notebooks/040-review/Practice\ Problems\ Bank.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir build-html/ "$<"

build-pdf/Practice\ Problems\ Bank.pdf: notebooks/040-review/Practice\ Problems\ Bank.ipynb
	jupyter nbconvert --to webpdf --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir build-pdf "$<"

%.zip: %.md
	pandoc -f markdown+latex_macros+tex_math_dollars -t html --mathml --no-highlight $< -o "$*.html"
	text2qti --template=brightspace $<
