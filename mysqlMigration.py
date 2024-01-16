import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy_utils import create_database, database_exists

csv_path = 'tweets-engagement-metrics.csv'
df = pd.read_csv(csv_path)
df.drop(df.columns.to_list()[0], axis=1, inplace=True)

mysql_url = 'mysql+mysqlconnector://root:anayak_98@localhost:3306/twitterdb'
if database_exists(mysql_url):
    print('Database already exists.')
else:
    create_database(mysql_url)
    print('Database created.')

engine = create_engine(mysql_url)
try:
    df.to_sql('tweets', con=engine, if_exists='replace', index=False)
    print('Migration to MySQL completed successfully.')
except:
    print('Migration to MySQL failed.')