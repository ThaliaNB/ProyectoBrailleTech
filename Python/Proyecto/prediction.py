import cv2
import numpy as np
import csv
    # Descomente la siguiente linea si esta utilizando la version 2.0 de Tensorflow
#from tensorflow.python.keras.preprocessing.image import load_img, img_to_array
    # Descomente la siguiente linea si esta utilizando Tensorflow en una version superior a 2.0 
from tensorflow.keras.preprocessing.image import load_img, img_to_array
from tensorflow.python.keras.models import load_model

class BraillePrediction:
    longitud, altura = 53, 53
    modelo = 'model.h5'
    pesos_modelo = 'pesos.h5'

    def __init__ (self):
        self.cnn = load_model(self.modelo)    # Carga del modelo entrenado
        self.cnn.load_weights(self.pesos_modelo)  # Carga de los pesos de la red
   
    def predictToImage(self, path_image):
        print("entro")
        x = load_img(path_image, target_size=(self.longitud, self.altura))
        x = img_to_array(x)   # Convertir la imagen en un arreglo
        x = np.expand_dims(x, axis=0)
        x /= 255.0  # Normalización
        array = self.cnn.predict(x)    # Array de dos dimensiones [[0,0...0]] donde la primer dimension contiene la cantidad de clases en el modelo
        # La prediccion arrojara como resultado un 1 en la clase correspondiente
        result = array[0] # La dimension 0 es la que incluye las clases del modelo entrenado
        answer = np.argmax(result)    # Obtiene el indice del elemento que tiene el valor mas alto
        # Proceso de comparacion entre cada indice del modelo entrenado
        print("\nLa CNN dice: ", answer)
        text_prediction = ''
        counter = 0
        with open("Training_indices.csv", encoding="ISO-8859-1") as file:
            reader = csv.reader(file, delimiter=',')
            for row in reader:
                if counter == 0:
                    text_prediction += "{}".format(row[answer])
                print("{}".format(row[answer]))
                counter += 1
        return text_prediction

