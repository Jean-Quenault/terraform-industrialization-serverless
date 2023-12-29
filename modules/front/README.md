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
| [aws_autoscaling_group.front](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_iam_instance_profile.front_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.front_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.front_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_launch_template.front](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_lb.front](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.fronttg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_route53_record.front](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.front_asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.front_lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_acm_certificate.certificate_front_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_front"></a> [certificate\_front](#input\_certificate\_front) | Front certificate ARN | `string` | n/a | yes |
| <a name="input_ecr_front_url"></a> [ecr\_front\_url](#input\_ecr\_front\_url) | L'URL du dépôt Elastic Container Registry | `string` | n/a | yes |
| <a name="input_front_image"></a> [front\_image](#input\_front\_image) | Le nom de l'image Docker pour le service frontal | `string` | n/a | yes |
| <a name="input_front_image_tag"></a> [front\_image\_tag](#input\_front\_image\_tag) | Le tag de l'image Docker pour le service frontal | `string` | n/a | yes |
| <a name="input_front_port"></a> [front\_port](#input\_front\_port) | Le port externe pour le service frontal | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | La région AWS où le dépôt ECR est hébergé | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Liste de subnets | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the choosen VPC | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->