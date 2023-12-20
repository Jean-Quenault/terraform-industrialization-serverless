import json
import os
import boto3
from botocore.exceptions import ClientError

def lambda_handler(event, context):
    
    # Initialize connection to the Dynamo DB
    
    dynamodb = boto3.resource('dynamodb')

    table_name = os.environ.get('table_name')
    table = dynamodb.Table(table_name)

    try:
        # One try to scan 1 item of the databse, if it's ok code 200, else code 500
        response = table.scan(Limit=1)
        return {
            'statusCode': 200,
            'body': json.dumps({'info': f'Connexion réussie à la table DynamoDB : {table_name}'}),
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*',
            }
        }
    except ClientError as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': f'Échec de connexion à la table DynamoDB : {table_name}', 'details': str(e)}),
            'headers': {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*',
            }
        }
