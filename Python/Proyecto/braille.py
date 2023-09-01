class BrailleConvertText:
    braille_to_text = {
        '100000': 'a', '101000': 'b', '110000': 'c',
        '110100': 'd', '100100': 'e', '111000': 'f',
        '111100': 'g', '101100': 'h', '011000': 'i',
        '011100': 'j', '100010': 'k', '101010': 'l',
        '110010': 'm', '110110': 'n', '100110': 'o',
        '111010': 'p', '111110': 'q', '101110': 'r',
        '011010': 's', '011110': 't', '100011': 'u',
        '101011': 'v', '011101': 'w', '110011': 'x',
        '110111': 'y', '100111': 'z'
    }
    charToArray = {
        " " : [[0,0],[0,0],[0,0]],
        "a" : [[1,0],[0,0],[0,0]],
        "b" : [[1,0],[1,0],[0,0]],
        "c" : [[1,1],[0,0],[0,0]],
        "d" : [[1,1],[0,1],[0,0]],
        "e" : [[1,0],[0,1],[1,0]],
        "f" : [[1,1],[1,0],[0,0]],
        "g" : [[1,1],[1,1],[0,0]],
        "h" : [[1,0],[1,1],[0,0]],
        "i" : [[0,1],[1,0],[1,0]],
        "j" : [[0,1],[1,1],[0,0]],
        "k" : [[1,0],[0,0],[1,0]],
        "l" : [[1,0],[1,0],[1,0]],
        "m" : [[1,1],[0,0],[1,0]],
        "n" : [[1,1],[0,1],[1,0]],
        "o" : [[1,0],[0,1],[1,1]],
        "p" : [[1,1],[1,0],[1,0]],
        "q" : [[1,1],[1,1],[1,0]],
        "r" : [[1,0],[1,1],[1,0]],
        "s" : [[0,1],[1,0],[1,0]],
        "t" : [[0,1],[1,1],[1,0]],
        "u" : [[1,0],[0,0],[1,1]],
        "v" : [[1,0],[1,0],[1,1]],
        "w" : [[0,1],[0,1],[1,1]],
        "x" : [[1,1],[0,0],[1,1]],
        "y" : [[1,1],[0,1],[1,1]],
        "z" : [[1,0],[0,1],[1,1]]
    }

    ascii_braille = {}

    asciicodes = [' ','!','"','#','$','%','&','','(',')','*','+',',','-','.','/',
            '0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?','@',
            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q',
            'r','s','t','u','v','w','x','y','z','[','\\',']','^','_']

    brailles = ['⠀','⠮','⠐','⠼','⠫','⠩','⠯','⠄','⠷','⠾','⠡','⠬','⠠','⠤','⠨','⠌','⠴','⠂','⠆','⠒','⠲','⠢',
            '⠖','⠶','⠦','⠔','⠱','⠰','⠣','⠿','⠜','⠹','⠈','⠁','⠃','⠉','⠙','⠑','⠋','⠛','⠓','⠊','⠚','⠅',
            '⠇','⠍','⠝','⠕','⠏','⠟','⠗','⠎','⠞','⠥','⠧','⠺','⠭','⠽','⠵','⠪','⠳','⠻','⠘','⠸']

    
    arrayLength = len(asciicodes)

    def __init__ (self):
        counter = 0
        while counter < self.arrayLength:
            self.ascii_braille[self.asciicodes[counter]] = self.brailles[counter]
            counter = counter + 1

    def textToBraille(self, text):
        final_string = ''
        for char in text:
            char = char.lower()
            if char == "a":
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["a"]))
            elif char == "b":
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["b"]))
            elif char == "c":
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["c"]))
            elif char == "d":
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["d"]))
            elif char == "e": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["e"]))
            elif char == "f": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["f"]))
            elif char == "g":
                final_string = final_string + self.ascii_braille[char] 
                print(char + " " + str(self.charToArray["g"]))
            elif char == "h": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["h"]))
            elif char == "i":
                final_string = final_string + self.ascii_braille[char] 
                print(char + " " + str(self.charToArray["i"]))
            elif char == "j": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["j"]))
            elif char == "k": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["k"]))
            elif char == "l": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["l"]))
            elif char == "m": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["m"]))
            elif char == "n": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["n"]))
            elif char == "o":
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["o"]))
            elif char == "p": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["p"]))
            elif char == "q": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["q"]))
            elif char == "r": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["r"]))
            elif char == "s": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["s"]))
            elif char == "t": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["t"]))
            elif char == "u": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["u"]))
            elif char == "v": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["v"]))
            elif char == "w":
                final_string = final_string + self.ascii_braille[char] 
                print(char + " " + str(self.charToArray["w"]))
            elif char == "x": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["x"]))
            elif char == "y": 
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["y"]))
            elif char == "z":
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray["z"]))
            elif char == " ":
                final_string = final_string + self.ascii_braille[char]
                print(char + " " + str(self.charToArray[" "]))
        return final_string
    
    def braille_to_normal(self, texto_braille):
        palabras_braille = texto_braille.split(' ')
        texto_normal = ''
        for palabra_braille in palabras_braille:
            caracteres_braille = palabra_braille.split()
            for caracter_braille in caracteres_braille:
                if caracter_braille in self.braille_to_text:
                    texto_normal += self.braille_to_text[caracter_braille]
            texto_normal += ' '
        return texto_normal.strip()
