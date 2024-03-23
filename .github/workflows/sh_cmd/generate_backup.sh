#!/bin/bash

# Obtener la fecha actual en el formato deseado (por ejemplo, YYYY-MM-DD)
backup_date=$(date +"%Y-%m-%d")

# Nombre del bucket de S3
bucket_name=$AWS_S3_BUCKET

# Crear un directorio en S3 con la fecha actual como nombre
aws s3api put-object --bucket $bucket_name --key "backup/$backup_date/" --access-key $AWS_ACCESS_KEY_ID --secret-key $AWS_SECRET_ACCESS_KEY

# Copiar todos los archivos actuales en S3 al directorio de respaldo recién creado
aws s3 cp s3://$bucket_name/ s3://$bucket_name/backup/$backup_date/ --recursive --access-key $AWS_ACCESS_KEY_ID --secret-key $AWS_SECRET_ACCESS_KEY
