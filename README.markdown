# BMI Analysis Project

## Description

The `elif_mirza_bmi_project.ipynb` Jupyter Notebook investigates the relationship between lifestyle factors, eating habits, physical activity, and Body Mass Index (BMI) using a dataset from the UC Irvine Machine Learning Repository. The project employs multiple analytical approaches, including linear regression, decision tree modeling, and clustering, to explore how variables such as diet, alcohol consumption, physical activity, and gender influence BMI and obesity levels. Key findings highlight that healthy lifestyles do not necessarily correlate with lower BMI, potentially due to inconsistent habits or unaccounted factors like dieting motivations.

## Installation

To run the notebook, set up an R environment with the required packages. The notebook is designed to work in a Jupyter environment (e.g., Jupyter Notebook or JupyterLab) with the IRkernel installed.

1. Install R (version 4.2.1 or later recommended):

   - Download from CRAN.

2. Install the IRkernel for Jupyter:

   ```R
   install.packages("IRkernel")
   IRkernel::installspec()
   ```

3. Install required R packages:

   ```R
   install.packages(c(
     "data.table", "tidyverse", "magrittr", "plotly", "ggplot2",
     "rpart", "rpart.plot", "visNetwork", "broom", "caret",
     "psych", "GGally", "lindia", "car", "BBmisc", "cluster",
     "compareGroups", "NbClust", "heatmaply", "dendextend",
     "circlize", "factoextra", "fastcluster", "microbenchmark",
     "formattable", "knitr", "kableExtra", "IRdisplay", "vegan",
     "listviewer"
   ))
   ```

4. Clone or download the repository:

   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

## Usage

1. Open the notebook in Jupyter:

   ```bash
   jupyter notebook elif_mirza_bmi_project.ipynb
   ```

2. Run the cells sequentially to:

   - Load the dataset from the GitHub-hosted CSV.
   - Preprocess data (e.g., normalizing/flooring variables).
   - Build and evaluate linear regression models (with and without gender interaction terms).
   - Construct and visualize decision tree models (normalized and floored data).
   - Attempt clustering analysis (k-means, though noted as ineffective for labeled data).
   - Generate visualizations and performance metrics.

3. Review outputs, including plots (e.g., actual vs. predicted BMI, residuals) and tables (e.g., R², RMSE, MAE, confusion matrices).

## Inputs

- **Dataset**: The Obesity Dataset (`ObesityDataSet_raw_and_data_sinthetic.csv`) is downloaded from a GitHub URL (`http://raw.githubusercontent.com/elifsakcay/ad48g-proje/...`). It contains 2111 rows and 17 columns, including:
  - **Demographic**: `Gender`, `Age`, `Height`, `Weight`.
  - **Lifestyle**: `FAVC` (frequent consumption of high-calorie food), `FCVC` (frequency of vegetable consumption), `NCP` (number of main meals), `CAEC` (consumption of food between meals), `SMOKE`, `CH2O` (daily water consumption), `SCC` (calorie consumption monitoring), `FAF` (physical activity frequency), `TUE` (time using technology devices), `CALC` (alcohol consumption), `MTRANS` (transportation mode).
  - **Health**: `family_history_with_overweight`, `NObeyesdad` (obesity level classification).
- **Parameters**:
  - Train-test split ratio: 70% training, 30% testing.
  - Decision tree complexity parameter (`cp`) for pruning (determined via `printcp` and `plotcp`).
  - Clustering centers: Set to the number of unique `NObeyesdad` levels (7).

## Outputs

- **Linear Regression**:

  - Model performance metrics (R², RMSE, MAE) for training and test sets, with and without gender interaction terms (e.g., `model_dt_f`, `model_dt_f3`).
  - Plots: Actual vs. predicted BMI, residuals vs. predictions, Q-Q plots for normality.
  - Summary statistics and significant coefficients (p-value &lt; 0.1).

- **Decision Tree**:

  - Decision tree visualizations (`visNetwork::visTree`) for floored data, showing splits based on variables like `FCVC_floored`, `Age`, `Gender`, `CALC`.
  - Confusion matrices for training and test sets, reporting accuracy, kappa, sensitivity, and specificity.
  - Pruned tree analysis (no significant improvement observed).

- **Clustering**:

  - K-means clustering results (though ineffective due to labeled data).
  - Summary tables mapping clusters to `NObeyesdad` categories (`co_match`, `max_n_data`).

- **General**:

  - Bar plots of `NObeyesdad` distribution in training and test sets.
  - Console outputs for model summaries, cluster assignments, and performance metrics.

## Usage Notes

- **Data Preprocessing**: The notebook normalizes (`_normalized`) and floors (`_floored`) continuous variables (e.g., `TUE`, `NCP`, `FCVC`). The floored version is preferred for decision trees due to similar performance.
- **Model Limitations**:
  - Linear regression models show moderate R² (\~0.48–0.49), indicating limited explanatory power.
  - Decision trees struggle with `Normal_Weight` and `Overweight_Level_II` classifications (low sensitivity).
  - Clustering is ineffective for labeled data, included for demonstration only.
- **Dependencies**: Ensure all packages are installed to avoid errors, especially for visualization (`plotly`, `visNetwork`) and clustering (`factoextra`, `cluster`).
- **Warnings**: The notebook generates package conflict warnings (e.g., `tidyverse` vs. `data.table`). Use the `conflicted` package or ignore if functionality is unaffected.
- **Dataset Access**: The dataset is fetched online; ensure internet connectivity or host the CSV locally and update the `fread` URL.
- **Findings Interpretation**: Results suggest lifestyle factors alone do not strongly predict BMI, possibly due to unmeasured factors (e.g., dieting status, recent lifestyle changes).


## License

No License