import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter

# configuration

DATA_PATH = "output_data/top_paying_jobs.csv"
OUTPUT_PATH = "assets/top_paying_jobs.png"
TITLE = "Top 10 Highest-Paying Data Science Roles (2023)"
X_LABEL = "Average Annual Salary (USD)"
Y_COLUMN = "job_title"
X_COLUMN = "salary_year_avg"


# load data

df = pd.read_csv(DATA_PATH)

# data preparation

df[X_COLUMN] = df[X_COLUMN].astype(float)
df = df.sort_values(by=X_COLUMN, ascending=True)

# format function for plot scale
def dollars(x, pos):
    return f"${int(x):,}"


# plot

plt.figure()
plt.barh(df[Y_COLUMN], df[X_COLUMN])
plt.xlabel(X_LABEL)
plt.gca().xaxis.set_major_formatter(FuncFormatter(dollars))
plt.title(TITLE)
plt.tight_layout()

# save & show

plt.savefig(OUTPUT_PATH, dpi=300)
plt.show()
