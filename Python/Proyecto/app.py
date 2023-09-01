import base64
import json
from codecs import encode

from flask import Flask, jsonify, request

from braille import BrailleConvertText
from prediction import BraillePrediction

app = Flask(__name__)

# Datos de ejemplo (pueden ser reemplazados por tu lógica)
datos = {
    1: "Dato 1",
    2: "Dato 2",
    3: "Dato 3"
}

# Ruta para obtener todos los datos
@app.route('/braille/convert-text', methods=['POST'])
def braille_convert_text():
    if request.method == 'POST':
        try:
            request_data = request.get_json()
            text = request_data['text']
            print(text)
            brailleConvert = BrailleConvertText()
            text_convert = brailleConvert.textToBraille(text)
            return jsonify({
                "text_convert": text_convert
            })
        except Exception as e:
           return jsonify({'error': str(e), "text_convert": ""}) 

    else:
        return jsonify({'error': 'no esta permitido', "text_convert": ""})


@app.route('/braille/convert-normal', methods=['POST'])
def braille_to_normal():
    if request.method == 'POST':
        try:
            request_data = request.get_json()
            text = request_data['text']
            print(text)
            brailleConvert = BrailleConvertText()
            text_convert = brailleConvert.braille_to_normal(text)
            return jsonify({
                "text_convert": text_convert
            })
        except Exception as e:
           return jsonify({'error': str(e), "text_convert": ""}) 

    else:
        return jsonify({'error': 'no esta permitido', "text_convert": ""})


@app.route('/braille/prediction', methods=['POST'])
def prediction():
    if request.method == 'POST':
        try:
            request_data = request.get_json()
            request_image = request_data['image']
            base64_img = request_image
            bytes_img = encode(base64_img, 'utf-8')
            binary_img = base64.decodebytes(bytes_img)
            with open("imageToSave.jpg", "wb") as fh:
                fh.write(binary_img)
            brailleConvert = BraillePrediction()
            text_convert = brailleConvert.predictToImage("imageToSave.jpg")
            return jsonify({
                "text_convert": text_convert
            })
        except Exception as e:
           print(e)
           return jsonify({'error': str(e), "text_convert": ""}) 

    else:
        print(e)
        return jsonify({'error': 'no esta permitido', "text_convert": ""})


if __name__ == '__main__':
    app.run(debug=True)