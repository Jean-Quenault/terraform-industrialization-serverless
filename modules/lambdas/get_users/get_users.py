import json
import boto3
import os

def lambda_handler(event, context):

    # Initialize connection to the Dynamo DB
    
    dynamodb = boto3.resource('dynamodb')

    table_name = os.environ.get('table_name')
    table = dynamodb.Table(table_name)

    # Scan all the table
    try:
        response = table.scan()
        items = response['Items']

        # Format data according to desired structure (json body)
        formatted_data = [
            {
                "id": item.get("id"),
                "ip": item.get("ip"),
                "navigateurs": item.get("navigateurs"),
                "os": item.get("os")
            } for item in items
        ]

        return {
            'statusCode': 200,
            'body': json.dumps(formatted_data),
            'headers': {
                'Access-Control-Allow-Origin': '*', 
            }
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps(str(e))
        }
