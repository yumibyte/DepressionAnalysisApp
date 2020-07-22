#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 14 22:53:42 2020

@author: ashleyraigosa
"""

# Artificial Neural Network

# Installing Theano

# Installing Tensorflow

# Installing Keras

# Part 1 - Data Preprocessing

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
# Importing the dataset
dataset = pd.read_csv('Empath_Analysis.csv')
X = dataset.iloc[:, 2:197].values

#np.nan_to_num(X)
for x in X:
    if np.isnan(x) == True:
        print(x)

y = dataset.iloc[:, 0].values

# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

# Create the ANN
# Import Keras librariers and packages
import keras
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import Dropout

# Initializing ANN
classifier = Sequential()

# Adding input layer and first hidden layer with dropout
classifier.add(Dense(output_dim = 1, init = 'uniform', activation = 'relu', input_dim = 195))
classifier.add(Dropout(p = 0.1))


# Adding the second hidden layer
classifier.add(Dense(output_dim = 1, init = 'uniform', activation = 'relu'))
classifier.add(Dropout(p = 0.1))

# Adding output layer
classifier.add(Dense(output_dim = 1, init = 'uniform', activation = 'sigmoid'))

# Compiling the ANN
classifier.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy'])

# Fitting ANN to Training set
classifier.fit(X_train, y_train, batch_size = 25, nb_epoch = 500)

# Predicting the Test set results
y_pred = classifier.predict(X_test)
y_pred = (y_pred > 0.5)
"""
# Load model
# save the model to disk
from keras.models import load_model
import coremltools

classifier.save('Depression_Deep_Learning_Model.h5')
"Depression_Deep_Learning_Model".author = 'Ashley Raigosa'
"Depression_Deep_Learning_Model".short_description = 'Depression Recognition based on time posted, content, and title'
"Depression_Deep_Learning_Model".output_description['output'] = 'Prediction of whether text is related to depression'

output_labels = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
your_model = coremltools.converters.keras.convert('Depression_Deep_Learning_Model.h5', input_names=['created', 'title', 'content'], output_names=['liklihood_of_deoression'], 
                                                   class_labels=output_labels, twitter_input_names='post')
your_model.save('Depression_Deep_Learning_Model.mlmodel')

"""

# Predicting a single new observation
""" Predict if the customer with the following info will leave the bank:
    Geography: France
    Credit Score: 600
    Gender: Male
    Age: 40
    Tenure: 3
    Balance: 60000
    Number of Products: 2
    Has credit card: Yes
    Is active Member: Yes
    Estimated Salary: 5000"""
#new_prediction = classifier.predict(sc.transform(np.array([[0, 0, 600, 1, 40, 3, 60000, 2, 1, 1, 50000]])))
#new_prediction = (new_prediction > 0.5)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)

# Part 4 - Evaluating, Improving, and tuning the ANN



# Evaluating the ANN
from keras.wrappers.scikit_learn import KerasClassifier
from sklearn.model_selection import cross_val_score


def build_classifier(): 
    classifier = Sequential()
    classifier.add(Dense(output_dim = 6, init = 'uniform', activation = 'relu', input_dim = 11))
    classifier.add(Dense(output_dim = 6, init = 'uniform', activation = 'relu'))
    classifier.add(Dense(output_dim = 1, init = 'uniform', activation = 'sigmoid'))
    classifier.compile(optimizer = 'adam', loss = 'binary_crossentropy', metrics = ['accuracy'])
    return classifier
classifier = KerasClassifier(build_fn = build_classifier, batch_size = 10, nb_epoch = 100)
accuracies = cross_val_score(estimator = classifier, X = X_train, y = y_train, cv = 10, n_jobs = -1)
mean = accuracies.mean()
variance = accuracies.std()

# Improving the ANN
# Dropout regularization to reduce overfitting if needed

# Tuning the ANN
from keras.wrappers.scikit_learn import KerasClassifier
from sklearn.model_selection import GridSearchCV
from keras.models import Sequential
from keras.layers import Dense

def build_classifier(optimizer): 
    classifier = Sequential()
    classifier.add(Dense(output_dim = 6, init = 'uniform', activation = 'relu', input_dim = 195))
    classifier.add(Dense(output_dim = 6, init = 'uniform', activation = 'relu'))
    classifier.add(Dense(output_dim = 1, init = 'uniform', activation = 'sigmoid'))
    classifier.compile(optimizer = optimizer, loss = 'binary_crossentropy', metrics = ['accuracy'])
    return classifier

classifier = KerasClassifier(build_fn = build_classifier)
parameters = {'batch_size': [25, 32],
              'nb_epoch': [100, 500],
              'optimizer': ['adam', 'rmsprop']}
grid_search = GridSearchCV(estimator = classifier, 
                           param_grid = parameters,
                           scoring = 'accuracy',
                           cv = 10)

grid_search = grid_search.fit(X_train, y_train)
best_parameters = grid_search.best_params_ 
best_accuracy = grid_search.best_score_

