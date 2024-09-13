import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np

# 1
df = pd.read_csv('medical_examination.csv')

# 2
df['overweight'] = df['weight'] / ((df['height'] / 100) ** 2)
df['overweight'] = df['overweight'].apply(lambda x: 1 if x > 25 else 0)

# 3
df['gluc'] = df['gluc'].apply(lambda x: 1 if x > 1 else 0)
df['cholesterol'] = df['cholesterol'].apply(lambda x: 1 if x > 1 else 0)


# 4
def draw_cat_plot():
    # 5
    df_cat = pd.melt(df, id_vars=['cardio'], value_vars=['active', 'alco', 'cholesterol', 'gluc', 'overweight', 'smoke'], var_name='variable', value_name='value')
    
    # 6
    df_cat = df_cat.groupby(['cardio','variable', 'value']).size().reset_index(name='total')


    # 7
    # 8
    fig = sns.catplot(data=df_cat, x="variable", y="total", hue="value", col="cardio", 
                    kind="bar", height=5, aspect=1.0)



    # 9. Save the figure
    fig.figure.savefig('catplot.png')
    
    return fig.figure 
    


# 10
def draw_heat_map():
    # 11
    df_heat = df[
        (df['ap_lo'] <= df['ap_hi'])&
        (df['height'] >= df['height'].quantile(0.025)) & (df['height'] <= df['height'].quantile(0.975))
        & 
        (df['weight'] >= df['weight'].quantile(0.025)) & (df['weight'] <= df['weight'].quantile(0.975))
        ]

    # 12
    corr = df_heat.corr(method='pearson', min_periods=20000)

    # 13
    mask = np.triu(corr)

    # 14
    fig, ax = plt.subplots(figsize=(20, 10))

    # 15
    sns.heatmap(corr, mask=mask, annot=True, fmt='.1f', cmap='magma' ,ax=ax)
    ax.set_xticklabels(df.columns.to_list(),rotation=90)

    # 16
    fig.savefig('heatmap.png')
    return fig
