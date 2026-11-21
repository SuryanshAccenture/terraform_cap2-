# Static website on Amazon S3

Terraform creates a public S3 website bucket and uploads `index.html`. The
website endpoint uses HTTP, not HTTPS. Do not upload private content to this
bucket. AWS charges may apply.

## Prerequisites

- Terraform 1.3 or later.
- AWS credentials with permission to create and configure S3 buckets and policies.
- Account-level S3 Block Public Access and organizational policies must allow
  public bucket policies. This configuration does not change account settings.

## Deploy

```sh
terraform init
terraform plan
terraform apply
```

The default region is `us-east-1`. To select another region, pass
`-var="aws_region=REGION"` to `terraform plan` and `terraform apply`.

Open the `website_url` output in a browser, or test it with:

```sh
curl -i "$(terraform output -raw website_url)"
```

Edit `index.html` and run `terraform apply` again to update the site. Terraform
state is local by default; keep it private and do not commit it to Git.

## Clean up

Run `terraform destroy` to remove the resources. Objects added outside Terraform
must be removed from the bucket first.