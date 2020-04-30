#!/bin/bash

### Script that obtains apk code with apktool, then find common certificate  
### pinning libraries 
### Output --> json files with occurences 

directory="/home/buhohacker/Documentos/APKs"
dirInitialCode="/home/buhohacker/Documentos/Scripts"
dirFinalCode="/home/buhohacker/Documentos/Resources/Code"
dirFiles="/home/buhohacker/Documentos/Resources/Files"

for file in $(ls $directory)
do  
    echo -e "\nThe APK file is: $file..........................\n"
    echo "############### Starting Apktool ###############"
    apktool d $directory/$file
    echo -e "################# End Apktool ##################\n"
        
    # Mover solamente los directorios que serán la salida de apktool --> if que verifique directorios
    for fileCode in $(ls $dirInitialCode)
    do
        echo "Checking if $fileCode is APK directory......." 
        echo "............................................."
        if [ -d $fileCode ]
        then
            # Check if file with code does not exist in dirFinalCode
            if [ ! -d $dirFinalCode/$fileCode ]
            then 
                mv $fileCode $dirFinalCode
            else 
                echo "File $fileCode already exists........"
                echo "....................................."
                rm -r $fileCode
            fi
        else
            echo "File $fileCode is not APK directory......"
            echo "........................................."
        fi
     done
done


# Find security packages in smali code of apks, generates files with occurences
for fileCapk in $(ls $dirFinalCode)
do
    # Verificar previamente si existe el directorio
    if [ ! -d $dirFiles/$fileCapk ]
    then
        # Create directory for each apk
        echo "New directory $fileCapk create.............."
        mkdir $dirFiles/$fileCapk # --> Si se quiere actualizar sobreescribir directorio
        #chmod 777 $dirFiles/$fileCapk
    else
        #chmod 777 $dirFiles/$fileCapk
        echo "Directory" $fileCapk "already exists........"
        echo "Overwriting................................."
        echo "............................................"
    fi   
    
    ### Case okhttp3 ###
    #grep -ri "okhttp3" $dirFinalCode/$fileCapk > $dirFiles/$fileCapk/file_okhttp3.json
    #chmod 777 $dirFiles/$fileCapk/file_okhttp3.json
    ### Case Trustkit ###
    #grep -ri "trustkit" $dirFinalCode/$fileCapk > $dirFiles/$fileCapk/file_trustkit.json  
    #chmod 777 $dirFiles/$fileCapk/file_trustkit.json 
    ### Case TrustManager ###
    #grep -ri "trustmanager" $dirFinalCode/$fileCapk > $dirFiles/$fileCapk/file_trustmanager.json
    #chmod 777 $dirFiles/$fileCapk/file_trustmanager.json  
    ### Case Appcelerator ###
    #grep -ri "appcelerator" $dirFinalCode/$fileCapk > $dirFiles/$fileCapk/file_appcelerator.json
    #chmod 777 $dirFiles/$fileCapk/file_appcelerator.json
    
    ### Case OpenSSLSocketImpl ###
    grep -ri "opensslsocketimpl" $dirFinalCode/$fileCapk > $dirFiles/$fileCapk/file_opensslsocketimpl.json
    #chmod 777 $dirFiles/$fileCapk/file_opensslsocketimpl.json
done






