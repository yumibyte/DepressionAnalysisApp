#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 14 19:09:04 2020

@author: ashleyraigosa
"""
    
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

def Classify_Text(in_file_name, text_type):
    # Importing the dataset
    dataset = pd.read_csv(in_file_name)
            
    # Take key values for future processing
    """
    X_key_vars = dataset.iloc[:, 3:8].values
    """
    
    # Take solely text to be processed
    if text_type == "title":
        X = dataset.iloc[:, 4].values
    if text_type == "content":
        X = dataset.iloc[:, 7].values
    y = dataset.iloc[:, 8].values

    # Process text function
    from sklearn.feature_extraction.text import CountVectorizer
    from sklearn.model_selection import train_test_split
    from sklearn.naive_bayes import MultinomialNB
    from sklearn.metrics import classification_report
    
    # Train Model
    cv = CountVectorizer()
    X = cv.fit_transform(X) # Fit the Data
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    #Naive Bayes Classifier
    clf = MultinomialNB()
    clf.fit(X_train,y_train)
    clf.score(X_test,y_test)
    y_pred = clf.predict(X_test)
    global X_probability_results
    X_probability_results = clf.predict_proba(X)
    #print(classification_report(y_test, y_pred))
    return X_probability_results


import csv
from pandas import read_csv      

def Text_Swap(text_type, in_file_name, out_file_name):
    # Swap text for probabilities
    with open(in_file_name, 'r', newline='') as file:
        reader = csv.reader(file)
        next(reader)
        
        count = 0
        
        # find index of text based on type
        if text_type == "title":
            index_of_text_in_DB = 4
        if text_type == "content":
            index_of_text_in_DB = 7
        
        # Begin with header prewritten into list 
        list = [['url', 'subreddit', 'author_name', 'created', 'title', 'score', 'upvote_ratio', 'content', 'result']]
        for row in reader: 
            if count < len(X_probability_results) + 1:
                
                # modify desired element in row
                row[index_of_text_in_DB] = X_probability_results[count][1]
                list.append(row)
                count += 1
    
    # Write list to csv file
    with open(out_file_name, 'w', newline='') as mycsvfile:
        thedatawriter = csv.writer(mycsvfile, lineterminator = '\n')
        thedatawriter.writerows(list) 
        
    # View results in variable explorer
    #csv_read = pd.read_csv('TEST_CASE.csv')
    #csv_result = pd.read_csv('TEST_CASE_RESULT.csv')
    
Classify_Text('TEST_CASE.csv', "content")
Text_Swap("content", 'TEST_CASE_RESULTS.csv', 'TEST_CASE_RESULTS.csv')



# create pickle and pkl file

"""
print(classification_report(y_test, y_pred))

Store cv for deeplearning model
import pickle

f = open('store.pckl', 'wb')
pickle.dump(cv, f)
f.close()

result = clf.predict(cv.transform(np.array(['Very cool!'])))
import joblib
joblib.dump(clf, 'Depression_NLP_model.pkl') 
"""

