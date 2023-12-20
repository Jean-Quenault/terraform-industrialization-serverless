import json
import os
import boto3
import uuid
from botocore.exceptions import ClientError

def lambda_handler(event, context):
    
    # Initialize connection to the Dynamo DB

    dynamodb = boto3.resource('dynamodb')

    table_name = os.environ.get('table_name')
    table = dynamodb.Table(table_name)

    # Parse the request body to avoid bad data input

    try:
        body = json.loads(event['body'])
    except json.JSONDecodeError:
        return {
            'statusCode': 400,
            'body': json.dumps('Invalid request body')
        }

    # Generate a single UUID (<=> id) for each line input

    new_id = str(uuid.uuid4())

    # Add the UUID as a primary key in the query body

    body['id'] = new_id 

    # Insert data into DynamoDB

    try:
        response = table.put_item(Item=body)
        return {
            'statusCode': 200,
            'body': json.dumps('Item created successfully'),
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Headers': '*',
                'Access-Control-Allow-Methods': '*'
            }
        }
    except ClientError as e:
        return {
            'statusCode': 500,
            'body': json.dumps(e.response['Error']['Message']),
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Headers': '*',
                'Access-Control-Allow-Methods': '*'
            }
        }
