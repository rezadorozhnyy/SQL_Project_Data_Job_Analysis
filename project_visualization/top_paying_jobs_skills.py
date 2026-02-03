import pandas as pd
import matplotlib.pyplot as plt

# configuration

DATA_PATH = "output_data/top_paying_jobs_skills.csv"
OUTPUT_PATH = "assets/top_paying_job_skills.png"
TITLE = "Most Common Skills Required for Top-Paying Data Science Jobs"
X_LABEL = "Number of Job Postings"
Y_COLUMN = "skills"

# load data

df = pd.read_csv(DATA_PATH)

# aggregate skills

skill_counts = (
    df[Y_COLUMN]
    .value_counts()
    .reset_index()
)

skill_counts.columns = ["skill", "count"]

# sort for plotting

skill_counts = skill_counts.sort_values(by="count", ascending=False)

# plot

plt.figure()
plt.barh(skill_counts["skill"], skill_counts["count"])
plt.xlabel(X_LABEL)
plt.title(TITLE)

# put highest count at the top
plt.gca().invert_yaxis()

plt.tight_layout()
plt.savefig(OUTPUT_PATH, dpi=300)
plt.show()
