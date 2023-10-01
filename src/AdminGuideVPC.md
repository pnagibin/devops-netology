## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.develop](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.develop](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | `"b1g8s1ohvs8upe37s11u"` | no |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | `"b1glcfkt2b3gabls6e7e"` | no |
| <a name="input_token"></a> [token](#input\_token) | OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token | `string` | `"y0_AgAAAAABtObhAATuwQAAAADs5049pjZQsPZuR12wvJVWFrL_KSDN4_M"` | no |
| <a name="input_vpc_network_name"></a> [vpc\_network\_name](#input\_vpc\_network\_name) | yandex\_vpc\_network name | `string` | n/a | yes |
| <a name="input_vpc_subnet_name"></a> [vpc\_subnet\_name](#input\_vpc\_subnet\_name) | yandex\_vpc\_subnet name | `string` | n/a | yes |
| <a name="input_vpc_subnet_v4_cidr_blocks"></a> [vpc\_subnet\_v4\_cidr\_blocks](#input\_vpc\_subnet\_v4\_cidr\_blocks) | yandex\_vpc\_subnet v4\_cidr\_blocks | `string` | n/a | yes |
| <a name="input_vpc_subnet_zone"></a> [vpc\_subnet\_zone](#input\_vpc\_subnet\_zone) | yandex\_vpc\_subnet zone | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output_vpc_network_id"></a> [output\_vpc\_network\_id](#output\_output\_vpc\_network\_id) | n/a |
| <a name="output_output_vpc_subnet_id"></a> [output\_vpc\_subnet\_id](#output\_output\_vpc\_subnet\_id) | n/a |
| <a name="output_output_vpc_subnet_name"></a> [output\_vpc\_subnet\_name](#output\_output\_vpc\_subnet\_name) | n/a |
| <a name="output_output_vpc_subnet_v4_cidr_blocks"></a> [output\_vpc\_subnet\_v4\_cidr\_blocks](#output\_output\_vpc\_subnet\_v4\_cidr\_blocks) | n/a |
| <a name="output_output_vpc_subnet_zone"></a> [output\_vpc\_subnet\_zone](#output\_output\_vpc\_subnet\_zone) | n/a |
