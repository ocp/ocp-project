<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Value to render out additional tags at will. | `map(string)` | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Additional fine-grained labelling data. | `list(string)` | `null` | no |
| <a name="input_context"></a> [context](#input\_context) | Another label's context for extension. | `any` | <pre>{<br/>  "additional_tag_map": {},<br/>  "attributes": [],<br/>  "delimiter": null,<br/>  "descriptor_formats": {},<br/>  "enabled": true,<br/>  "environment": null,<br/>  "id_length_limit": null,<br/>  "label_key_case": null,<br/>  "label_order": [],<br/>  "label_value_case": null,<br/>  "labels_as_tags": [<br/>    "unset"<br/>  ],<br/>  "name": null,<br/>  "namespace": null,<br/>  "regex_replace_chars": null,<br/>  "stage": null,<br/>  "tags": {},<br/>  "tenant": null<br/>}</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Identify the deployment environment. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The pattern used to render out the label's components. | `list(string)` | <pre>[<br/>  "namespace",<br/>  "tenant",<br/>  "environment",<br/>  "name",<br/>  "attributes"<br/>]</pre> | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Components that we want to render as tags. | `list(string)` | <pre>[<br/>  "environment",<br/>  "namespace",<br/>  "name"<br/>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | The main label identifier. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The top-level namespace. | `string` | `null` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | The tenant namespace (which we overload as our 'service' key). | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_context"></a> [context](#output\_context) | Expose the label's context for extension. |
| <a name="output_id"></a> [id](#output\_id) | Normalize out the full label string. |
| <a name="output_tags"></a> [tags](#output\_tags) | Expose the the label's tags. |
<!-- END_TF_DOCS -->