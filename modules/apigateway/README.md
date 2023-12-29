<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_aws.virginia"></a> [aws.virginia](#provider\_aws.virginia) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_base_path_mapping.mapping](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_base_path_mapping) | resource |
| [aws_api_gateway_deployment.prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_domain_name.backend_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_domain_name) | resource |
| [aws_api_gateway_rest_api.api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_api_gateway_stage.prod_stage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_stage) | resource |
| [aws_lambda_permission.api_gateway_permission_get_status_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.api_gateway_permission_get_users_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.api_gateway_permission_post_users_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_route53_record.api_dns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_acm_certificate.certificate_backend_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |
| [aws_route53_zone.root_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [template_file.api_swagger](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_url"></a> [backend\_url](#input\_backend\_url) | URL desired for the backend | `string` | n/a | yes |
| <a name="input_dynamodb_arn"></a> [dynamodb\_arn](#input\_dynamodb\_arn) | ARN of the DynamoDB to use | `string` | n/a | yes |
| <a name="input_get_status_prod_function_name"></a> [get\_status\_prod\_function\_name](#input\_get\_status\_prod\_function\_name) | Function name of the get\_status\_prod lambda | `string` | n/a | yes |
| <a name="input_get_status_prod_lambda_arn"></a> [get\_status\_prod\_lambda\_arn](#input\_get\_status\_prod\_lambda\_arn) | ARN of Lambda function getStatusProd | `string` | n/a | yes |
| <a name="input_get_users_prod_function_name"></a> [get\_users\_prod\_function\_name](#input\_get\_users\_prod\_function\_name) | Function name of the get\_users\_prod lambda | `string` | n/a | yes |
| <a name="input_get_users_prod_lambda_arn"></a> [get\_users\_prod\_lambda\_arn](#input\_get\_users\_prod\_lambda\_arn) | ARN of Lambda function getUsersProd | `string` | n/a | yes |
| <a name="input_post_users_prod_function_name"></a> [post\_users\_prod\_function\_name](#input\_post\_users\_prod\_function\_name) | Function name of the post\_users\_prod lambda | `string` | n/a | yes |
| <a name="input_post_users_prod_lambda_arn"></a> [post\_users\_prod\_lambda\_arn](#input\_post\_users\_prod\_lambda\_arn) | ARN of Lambda functionpostUsersProd | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | La région AWS où le dépôt ECR est hébergé | `string` | n/a | yes |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | Table name of the DynamoDB to use | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->