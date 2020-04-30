#!/usr/bin/python3

### Script checks if the output files from find_libraries.sh are empty or not
### If not then exists certificate pinning package/library

import os

    
def checkFile(file):
    lib = ""
    if os.stat(file).st_size == 0:
        lib = "Empty" + " " + file
        print(lib)
    else:
        lib = "Found library" + " " + file
        print(lib)
    #return res
    
if __name__ == "__main__":
    # Listar directorios de Files, acceder a cada uno de ellos y llamar a checkFile()
    listDir = os.listdir("/home/buhohacker/Documentos/Resources/Files/")
    #print listDir
    for i in listDir:
        var = "/home/buhohacker/Documentos/Resources/Files/" + i + "/"
        #print var

        listFiles = os.listdir(var)
        #print listFiles
        for j in listFiles:
            file = var + j
            #print file
            checkFile(file)
    
    
