import mysql.connector as mysql
import logging
import random 
from random import randrange
import bcrypt
import pandas as pd
import numpy as np
from datetime import datetime

# Global variables
db, cursor = None, None


# Data inputs
names = None
email_providers = 'gmail hotmail yahoo aol'.split(' ')

def init():
    """
    Initializes the database links and the cursor for navigation
    """
    global db, cursor
    db = mysql.connect
            host = 'app-db.cdslhq2tdh2f.us-east-2.rds.amazonaws.com',
            user = 'peanut',
            passwd = 'willywonka'
            )
    cursor = db.cursor()
    cursor.execute('use data;')



# use this to erase all data
def clear_data():
    tables = 'donations users non_profit login campaigns'.split(' ')
    for tab in tables:
        cursor.execute(f'delete from {tab};')
    db.commit()



def capitalize(name):
    return name[0].upper() + name[1:].lower()


def insert_user(username, name, email, password, image):
    cursor.execute(f'insert into users (username, name, emailID, profilePicture) values ("{username}", "{name}", "{email}", "{image}");')
    cursor.execute(f'insert into login (username, password) values ("{username}", "{password}");')



def insert_org(username, name, email, password, desc, country, profile_image, banner):
    cursor.execute(f'insert into non_profit (username, name, emailID, country, description, profilePicture, bannerImage) values ("{username}", "{name}", "{email}", "{country}", "{desc}", "{profile_image}", "{banner}");')
    cursor.execute(f'insert into login (username, password) values ("{username}", "{password}");')


def insert_campaign(title, desc, isActive, username, bannerImage):
    cursor.execute(f'insert into campaigns (title, description, isActive, username, bannerImage) values ("{title}", "{desc}", {isActive}, "{username}", "{bannerImage}");')


def insert_donation(username, campaignID, amount, timestamp):
    cursor.execute(f'insert into donations (username, campaignID, amount, timestamp) values ("{username}", {campaignID}, {amount}, "{timestamp}");')


def populate_users(num_users):
    global names
    f_name = open('NationalNames.csv', 'r')
    l_name = open('facebook-lastnames-withcount.txt', 'r')
    first = [capitalize(x.split(',')[1]) for x in f_name.read().split('\n')[:num_users]]
    last = [capitalize(x.strip().split(' ')[1]) for x in l_name.read().split('\n')[:num_users]]
    random.shuffle(first)
    random.shuffle(last)
    f_name.close()
    l_name.close()

    for x in range(num_users):
        print(f'Adding user #{x}')
        first_name = first.pop()
        last_name = last.pop()
        username = f'{first_name[:3]}{last_name}{randrange(65,99)}'.lower()
        email = f'{first_name[:2]}{last_name[:-3]}{randrange(10,999)}@{random.choice(email_providers)}.com'.lower()
        password = str(bcrypt.hashpw('Password123'.encode('utf8'), bcrypt.gensalt()))[2:-1]
        i_num = x%15
        extention = '.jpg' if i_num < 7 else 'png'
        image_link = f'https://db-images-link.s3.us-east-2.amazonaws.com/user_profile_pictures/{i_num}{extention}'
        insert_user(username, f'{first_name} {last_name}', email, password, image_link)

        
def populate_non_profits(num_orgs):
    df = pd.read_csv('CLEAN_charity_data.csv')
    orgs = df[['name', 'description']]
    orgs = orgs.values.tolist()
    random.shuffle(orgs)

    for x in range(num_orgs):
        org = orgs.pop()
        name = org[0]
        desc = org[1]
        desc = desc.replace('"','')
        name_cut = name.replace(' ','')
        username = f'{name_cut[:4]}{name_cut[2:8]}{randrange(5,999)}'.lower()
        password = str(bcrypt.hashpw('Password123'.encode('utf8'), bcrypt.gensalt()))[2:-1]
        country = 'USA'
        email = f'{name_cut[:6]}{randrange(5,999)}@{random.choice(email_providers)}.com'.lower()
        banner = f'https://db-images-link.s3.us-east-2.amazonaws.com/non_profit/banner/{(x%5) + 1}.jpg'
        profile_pic = f'https://db-images-link.s3.us-east-2.amazonaws.com/non_profit/logo/{(x%5) + 1}.jpg'

        insert_org(username, name, email, password, desc, country, profile_pic, banner)



def make_campaigns():
    cursor.execute('select * from non_profit')
    res = cursor.fetchall()
    x = 0
    df = pd.read_csv('CLEAN_charity_data.csv')
    for npo in res:
        name = npo[1]
        username = npo[0]
        banner = f'https://db-images-link.s3.us-east-2.amazonaws.com/non_profit/banner/{(x%5) + 1}.jpg'
        x += 1
        selection = df[df['name'] == name]
        row = selection.iloc[0]
        category = row['subcategory']
        broad_cat = row['category']
        leader = row['leader']
        motto = row['motto']
        size = row['size']
        size = 'large' if size == 'big' else size
        size = 'mid-sized' if size == 'mid' else size
        seed = randrange(1,7)
        if seed == 1:
            title = f'{category} Charity Drive'
        elif seed == 2:
            title = f'Help us improve {category}'
        elif seed == 3:
            title = f'{name}\'s 2020 Funding Campaign' 
        elif seed == 4:
            title = f'Help us preserve {category}'
        elif seed == 5:
            title = f'Global {broad_cat} Funding Circuit'
        else: 
            title = f'{leader}\'s Sponsored {broad_cat} Charity Drive'
        desc = f'{motto}. Hello, we\'re a {size} non-profit called {name}. Led by {leader}, we work towards promoting {broad_cat} in the United States and throughout the world. Donating to us would mean a better {category} experience for many, many people around the world. Consider donating to us today. If you\'d like to know more about us, click on our profile!'
        desc = desc.replace('"','')
        isActive = randrange(0,2)
        insert_campaign(title, desc, isActive, username, banner)


def make_donation():
    cursor.execute('select * from users')
    users = cursor.fetchall()
    cursor.execute('select * from campaigns')
    campaigns = cursor.fetchall()

    count = 1
    for user in users:
        print(f'Working on user {count}')
        count += 1
        seed = randrange(1,11)

        # Only approx 70% of users make donations
        if seed > 7:
            continue

        # username of user donating
        username = user[0]

        for campaign in campaigns:
            seed = randrange(1,11)

            # Users donate to about 40% of charities (maybe too high?)
            if seed > 4:
                continue

            campaignID = campaign[0]
            amount = randrange(5,10000)
            timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

            insert_donation(username, campaignID, amount, timestamp)


if __name__ == '__main__':
    # init()
    # ----- WARNING!!! -----
    # clear_data()
    # ----- WARNING!!! -----
    # populate_users(100)
    # populate_non_profits(50)
    # make_campaigns()
    # make_donation()
    # db.commit()
