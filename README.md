## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apigateway"></a> [apigateway](#module\_apigateway) | ./modules/apigateway | n/a |
| <a name="module_front"></a> [front](#module\_front) | ./modules/front | n/a |
| <a name="module_lambdas"></a> [lambdas](#module\_lambdas) | ./modules/lambdas | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_url"></a> [backend\_url](#input\_backend\_url) | URL desired for the backend | `string` | n/a | yes |
| <a name="input_dynamodb_arn"></a> [dynamodb\_arn](#input\_dynamodb\_arn) | Arn of the DynamoDB to use | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_subnet1"></a> [subnet1](#input\_subnet1) | ID du premier sous-réseau | `string` | n/a | yes |
| <a name="input_subnet2"></a> [subnet2](#input\_subnet2) | ID du deuxième sous-réseau | `string` | n/a | yes |
| <a name="input_subnet3"></a> [subnet3](#input\_subnet3) | ID du troisième sous-réseau | `string` | n/a | yes |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | Table name of the DynamoDB to use | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the choosen VPC | `string` | n/a | yes |

## Outputs

No outputs.
