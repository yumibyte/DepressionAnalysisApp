from empath import Empath
import pandas as pd
import empath
dataset = pd.read_csv("Depression_Reddit_Database_Filtered.csv")

X = dataset.iloc[:, 7:9].values
#y = dataset.iloc[:, 8].values
empath_analysis_dict = []
count = 0
for row in X:
    
    current_analysis = {}
    lexicon = Empath()

    current_analysis.update( { 'Text': row[0] } )
    current_analysis.update(lexicon.analyze(row[0], normalize=True))
    current_analysis.update( { 'Output': row[1]})
    empath_analysis_dict.append(current_analysis)
    count += 1
# Write to csv file
import csv

try:
 
    csv_columns = ['Output','Text', 'Type', 'Size', 'Value', 'economics', 'trust', 'technology', 'communication', 'noise', 'vehicle', 'rage', 'medical_emergency', 'sports', 'plant', 'poor', 'hipster', 'independence', 'pet', 'strength', 'hate', 'fabric', 'sailing', 'feminine', 'exotic', 'ugliness', 'superhero', 'cleaning', 'contentment', 'fear', 'nervousness', 'worship', 'shape_and_size', 'party', 'negotiate', 'ancient', 'childish', 'neglect', 'power', 'deception', 'messaging', 'legend', 'shame', 'affection', 'home', 'rural', 'tourism', 'air_travel', 'weapon', 'clothing', 'movement', 'driving', 'dominant_personality', 'urban', 'sleep', 'leisure', 'science', 'toy', 'love', 'furniture', 'hearing', 'white_collar_job', 'reading', 'fire', 'traveling', 'achievement', 'terrorism', 'journalism', 'youth', 'joy', 'tool', 'appearance', 'aggression', 'magic', 'envy', 'vacation', 'injury', 'prison', 'kill', 'night', 'family', 'medieval', 'surprise', 'military', 'real_estate', 'speaking', 'stealing', 'wedding', 'leader', 'cold', 'confusion', 'lust', 'anticipation', 'occupation', 'cooking', 'cheerfulness', 'exasperation', 'water', 'dominant_heirarchical', 'competing', 'play', 'divine', 'horror', 'death', 'restaurant', 'fight', 'payment', 'hiking', 'disgust', 'dance', 'sound', 'hygiene', 'beach', 'violence', 'alcohol', 'optimism', 'exercise', 'art', 'phone', 'healing', 'social_media', 'eating', 'anonymity', 'farming', 'meeting', 'masculine', 'order', 'sexual', 'shopping', 'ridicule', 'valuable', 'zest', 'ocean', 'body', 'blue_collar_job', 'negative_emotion', 'disappointment', 'torment', 'animal', 'anger', 'liquid', 'dispute', 'sympathy', 'car', 'office', 'friends', 'weakness', 'swimming', 'health', 'suffering', 'programming', 'gain', 'pride', 'wealthy', 'crime', 'college', 'government', 'politics', 'ship', 'smell', 'morning', 'children', 'beauty', 'pain', 'politeness', 'school', 'domestic_work', 'music', 'royalty', 'emotional', 'monster', 'fashion', 'philosophy', 'business', 'sadness', 'positive_emotion', 'breaking', 'fun', 'swearing_terms', 'money', 'listen', 'banking', 'timidity', 'musical', 'law', 'computer', 'attractive', 'work', 'warmth', 'irritability', 'writing', 'giving', 'internet', 'religion', 'heroic', 'help', 'celebration', 'war', 'weather', 'result']
    csv_file = 'Empath_Analysis.csv'
    with open(csv_file, 'w') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
            writer.writeheader()
            for data in empath_analysis_dict:
                writer.writerow(data)
except IOError:
    print("error")


