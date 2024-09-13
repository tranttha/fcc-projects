import matplotlib.pyplot as plt
import matplotlib as mpl

import pandas as pd
import seaborn as sns
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()

# Import data (Make sure to parse dates. Consider setting index column to 'date'.)
df = pd.read_csv('fcc-forum-pageviews.csv', parse_dates=['date'])
# print(df.dtypes)

# Clean data
df = df[(df['value'] > df['value'].quantile(0.025)) & (df['value'] < df['value'].quantile(0.975))]


def draw_line_plot():
    fig , ax= plt.subplots(figsize=(10, 5))

    plt.plot(df['date'], df['value'], color='red')
    ax.set_title('Daily freeCodeCamp Forum Page Views 5/2016-12/2019')
    ax.set_xlabel('Date')
    ax.set_ylabel('Page Views')

    # Save image and return fig1 (don't change this part)
    fig.savefig('line_plot.png')
    return fig

def draw_bar_plot():
    # Copy and modify data for monthly bar plot
    df_bar = df.copy()
    df_bar.reset_index(inplace=True)
    df_bar['Years'] = [d.year for d in df_bar.date]
    df_bar['Month'] = [d.month_name() for d in df_bar.date]
    df_bar=df_bar.drop(columns='date')
    df_bar = df_bar.groupby(['Years', 'Month'], as_index=False)['value'].mean().rename(columns={'value': 'Average Page Views'})
    # print(df_bar[['Years', 'Month']].nunique(), df_bar.shape)
    df_bar = df_bar.pivot(index='Years', columns='Month', values='Average Page Views').reset_index()

    month_order = ['January', 'February', 'March', 'April', 'May', 'June', 
                   'July', 'August', 'September', 'October', 'November', 'December']
    df_bar=df_bar.reindex(columns=['Month','Years']+month_order).drop(columns='Month')
    # print(df_bar.head())
    # Draw bar plot
    fig, ax= plt.subplots(figsize=(10, 10))
    df_bar.plot(x='Years', 
        kind='bar', 
        stacked=False, 
        color=sns.color_palette('tab10', 12), ax=ax) 
    ax.set_ylabel('Average Page Views')
    ax.set_xlabel('Years')
    

    fig.savefig('bar_plot.png')
    return fig

def draw_box_plot():
    # Prepare data for box plots (this part is done!)
    df_box = df.copy()
    df_box.reset_index(inplace=True)
    df_box['year'] = [d.year for d in df_box.date]
    df_box['month'] = [d.strftime('%b') for d in df_box.date]

    # Draw box plots (using Seaborn)
    fig,axes = plt.subplots(1, 2, figsize=(20, 10))
    sns.boxplot(data=df_box, x='year', y='value', ax=axes[0])
    axes[0].set_xlabel('Year')
    axes[0].set_ylabel('Page Views', rotation=90)
    axes[0].set_title('Year-wise Box Plot (Trend)')
    sns.boxplot(data=df_box, x='month', y='value', ax=axes[1], order=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'])
    axes[1].set_xlabel('Month')
    axes[1].set_ylabel('Page Views', rotation=90)
    axes[1].set_title('Month-wise Box Plot (Seasonality)')

    # Save image and return fig (don't change this part)
    fig.savefig('box_plot.png')
    return fig
