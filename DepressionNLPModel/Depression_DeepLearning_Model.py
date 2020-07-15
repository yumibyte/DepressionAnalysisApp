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

# result = clf.predict(cv.transform(np.array(['I hate myself!']))) # use this for binary output
# result_1 = clf.predict_proba(cv.transform(np.array(['I hate myself!']))) # percentage output

# Modify DB to contain percentages 


