import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import linregress

def draw_plot():
    # Read data from file
    df = pd.read_csv('epa-sea-level.csv')

    fig,ax = plt.subplots(figsize=(10,6))
    plt.scatter(df['Year'], df['CSIRO Adjusted Sea Level'], label='actual data', color='grey', alpha=0.5)

    ax.set_xlabel('Year')
    ax.set_ylabel('Sea Level (inches)')


    years_extended_1st = np.arange(df['Year'].min(), 2051)  # Extending up to 2050
    result_1st = linregress(df['Year'], df['CSIRO Adjusted Sea Level'])
    sea_level_pred_1st = result_1st.intercept + years_extended_1st * result_1st.slope

    years_extended_2nd = np.arange(2000, 2051)  # Extending up to 2050
    result_2nd = linregress(df['Year'][df['Year']>=2000], df['CSIRO Adjusted Sea Level'][df['Year']>=2000])
    sea_level_pred_2nd = result_2nd.intercept + years_extended_2nd * result_2nd.slope

    ax.plot(years_extended_1st, sea_level_pred_1st , color='blue', label='first line of best fit')
    ax.plot(years_extended_2nd,sea_level_pred_2nd, color='red', label='second line of best fit')


    ax.set_xlim(1850, 2075)
    ax.set_xticks(range(1850, 2100, 25))
    ax.set_ylim((df['CSIRO Adjusted Sea Level']+df['Lower Error Bound']).min(), sea_level_pred_2nd.max())

    ax.set_title('Rise in Sea Level')
    

    print(ax.get_lines()[0].get_ydata())
    
    # Save plot and return data for testing (DO NOT MODIFY)
    plt.savefig('sea_level_plot.png')
    return plt.gca()