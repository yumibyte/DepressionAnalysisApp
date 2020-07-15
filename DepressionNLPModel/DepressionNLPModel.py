#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 14 19:09:04 2020

@author: ashleyraigosa
"""
    
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Depression_Reddit_Database_Filtered.csv')

# Take key values for future processing
X_key_vars = dataset.iloc[:, 3:8].values
y = dataset.iloc[:, 8].values

# Take solely text to be processed
X_title = dataset.iloc[:, 4].values
X_content = dataset.iloc[:, 7].values

# Process text function
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import MultinomialNB
from sklearn.metrics import classification_report

# Train Model
cv = CountVectorizer()
X_content = cv.fit_transform(X_content) # Fit the Data
X_train, X_test, y_train, y_test = train_test_split(X_content, y, test_size=0.2, random_state=42)
#Naive Bayes Classifier
clf = MultinomialNB()
clf.fit(X_train,y_train)
clf.score(X_test,y_test)
y_pred = clf.predict(X_test)
# print(classification_report(y_test, y_pred))

# Store cv for deeplearning model
import pickle

f = open('store.pckl', 'wb')
pickle.dump(cv, f)
f.close()

#result = clf.predict(cv.transform(np.array(['Very cool!'])))
#import joblib
#joblib.dump(clf, 'Depression_NLP_model.pkl') 


