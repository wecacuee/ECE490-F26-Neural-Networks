QUIZ_MDS := $(wildcard notebooks/*/quiz_*.md)
QUIZ_ZIPS := $(QUIZ_MDS:.md=.zip)

all: \
	build-html/ProbabilityBasics.html \
	build-pdf/ProbabilityBasics.pdf \
	build-html/ProbabilisticPerspective.html \
	build-pdf/ProbabilisticPerspective.pdf \
	build-html/00-LinearModelsColab.html \
	build-pdf/00-LinearModelsColab.pdf \
	build-html/02-PlaneFitProblemColab.html \
	build-html/Practice\ Problems\ Bank.html \
	build-pdf/Practice\ Problems\ Bank.pdf \
	build-html/10-ContinuousOptimization.html \
	build-pdf/10-ContinuousOptimization.pdf \
	build-html/40-Perceptron3.html \
	build-pdf/40-Perceptron3.pdf \
	$(QUIZ_ZIPS)

notebooks/022-prob/exports-ProbabilityBasicsColab.ipynb: notebooks/022-prob/ProbabilityBasics.ipynb
	python3 scripts/export_ipynb_to_colab.py $<

notebooks/022-prob/exports-ProbabilisticPerspectiveColab.ipynb: notebooks/022-prob/ProbabilisticPerspective.ipynb
	python3 scripts/export_ipynb_to_colab.py $<

notebooks/020-linear-models/exports-10-ContinuousOptimizationColab.ipynb: notebooks/020-linear-models/10-ContinuousOptimization.ipynb
	python3 scripts/export_ipynb_to_colab.py $<

notebooks/020-linear-models/exports-40-Perceptron3Colab.ipynb: notebooks/020-linear-models/40-Perceptron3.ipynb
	python3 scripts/export_ipynb_to_colab.py $<

notebooks/020-linear-models/exports-00-LinearModelsColab.ipynb: notebooks/020-linear-models/00-LinearModels.ipynb
	python3 scripts/export_ipynb_to_colab.py $<

notebooks/020-linear-models/exports-02-PlaneFitProblemColab.ipynb: notebooks/020-linear-models/02-PlaneFitProblem.ipynb
	python3 scripts/export_ipynb_to_colab.py $<
####################################################3

build-html/ProbabilityBasics.html: notebooks/022-prob/exports-ProbabilityBasicsColab.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" --output "$(basename $(@F))" "$<"

build-pdf/ProbabilityBasics.pdf: notebooks/022-prob/exports-ProbabilityBasicsColab.ipynb
	jupyter nbconvert --to webpdf --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" --output "$(basename $(@F))" "$<"

build-html/ProbabilisticPerspective.html: notebooks/022-prob/exports-ProbabilisticPerspectiveColab.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" --output "$(basename $(@F))" "$<"

build-pdf/ProbabilisticPerspective.pdf: notebooks/022-prob/exports-ProbabilisticPerspectiveColab.ipynb
	jupyter nbconvert --to webpdf --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" --output "$(basename $(@F))" "$<"

build-html/10-ContinuousOptimization.html: notebooks/020-linear-models/exports-10-ContinuousOptimizationColab.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" --output "$(basename $(@F))" "$<"

build-pdf/10-ContinuousOptimization.pdf: notebooks/020-linear-models/exports-10-ContinuousOptimizationColab.ipynb
	jupyter nbconvert --to webpdf --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" --output "$(basename $(@F))" "$<"

build-html/40-Perceptron3.html: notebooks/020-linear-models/exports-40-Perceptron3Colab.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" --output "$(basename $(@F))" "$<"

build-pdf/40-Perceptron3.pdf: notebooks/020-linear-models/exports-40-Perceptron3Colab.ipynb
	jupyter nbconvert --to webpdf --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" --output "$(basename $(@F))" "$<"

build-html/00-LinearModelsColab.html: notebooks/020-linear-models/exports-00-LinearModelsColab.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" --output "$(basename $(@F))" "$<"

build-html/02-PlaneFitProblemColab.html: notebooks/020-linear-models/exports-02-PlaneFitProblemColab.ipynb
	jupyter nbconvert --to html --embed-images \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" --output "$(basename $(@F))" "$<"

build-pdf/00-LinearModelsColab.pdf: notebooks/020-linear-models/exports-00-LinearModelsColab.ipynb
	jupyter nbconvert --to webpdf --embed-images  \
		--theme jupyterlab-theme-githublight \
    	--config ./nbconvert_config.py \
        --output-dir "$(@D)" --output "$(basename $(@F))" "$<"


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
