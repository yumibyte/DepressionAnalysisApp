#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 14 22:53:42 2020

@author: ashleyraigosa
"""

import joblib
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import CountVectorizer
import pandas as pd
import numpy as np

# import pickle w/ cv
import pickle
f = open('store.pckl', 'rb')
cv = pickle.load(f)
f.close()

# import NLP model
NB_spam_model = open('Depression_NLP_model.pkl','rb')
clf = joblib.load(NB_spam_model)

#Calculate result

result = clf.predict(cv.transform(np.array(['Very cool!'])))

#clf.predict(test)
#new_prediction = classifier.predict(sc.transform(np.array([[0, 0, 600, 1, 40, 3, 60000, 2, 1, 1, 50000]])))

# Train Model
