#!/bin/bash

################################################################

function show_help { 
    echo -e "Help me ... I'm in hell!!"
    echo -e "USAGE: ./docx2files -c <DIR_NAME>" 
    echo -e "USAGE: ./docx2files -d <DOCUMENT_NAME>.docx" 
}

################################################################

while getopts c:d:h option
do
    case "${option}"
        in
        c) FTOCOMPRESS=${OPTARG}
           echo "[+] Directory to compress: " ${FTOCOMPRESS}
           cd $FTOCOMPRESS
           zip -r ../$FTOCOMPRESS.docx *
           ;;
        d) FTODECOMPRESS=${OPTARG}
           echo "[+] File to decompress: " ${FTODECOMPRESS}
           FTODECOMPRESS_BASE="${FTODECOMPRESS%.*}"
           unzip $FTODECOMPRESS -d $FTODECOMPRESS_BASE
           ;;
        h) show_help
    esac
done

################################################################
