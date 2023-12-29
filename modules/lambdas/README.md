<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.get_status_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.get_users_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.post_users_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.get_status_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.get_users_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.post_users_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.get_status_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.get_users_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.post_users_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.get_status_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_function.get_users_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_function.post_users_prod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dynamodb_arn"></a> [dynamodb\_arn](#input\_dynamodb\_arn) | Arn of the DynamoDB to use | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | La région AWS où le dépôt ECR est hébergé | `string` | n/a | yes |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | Table name of the DynamoDB to use | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_get_status_prod_function_name"></a> [get\_status\_prod\_function\_name](#output\_get\_status\_prod\_function\_name) | n/a |
| <a name="output_get_status_prod_lambda_arn"></a> [get\_status\_prod\_lambda\_arn](#output\_get\_status\_prod\_lambda\_arn) | n/a |
| <a name="output_get_users_prod_function_name"></a> [get\_users\_prod\_function\_name](#output\_get\_users\_prod\_function\_name) | n/a |
| <a name="output_get_users_prod_lambda_arn"></a> [get\_users\_prod\_lambda\_arn](#output\_get\_users\_prod\_lambda\_arn) | n/a |
| <a name="output_post_users_prod_function_name"></a> [post\_users\_prod\_function\_name](#output\_post\_users\_prod\_function\_name) | n/a |
| <a name="output_post_users_prod_lambda_arn"></a> [post\_users\_prod\_lambda\_arn](#output\_post\_users\_prod\_lambda\_arn) | n/a |
<!-- END_TF_DOCS -->