---
layout: default
title: Using S3 as gem source
url: /using-s3-source
previous: /using-mfa-in-command-line
next: /resources
---
<em class="t-gray">How to use S3 bucket as gem source.</em>

[Gem server solutions](/run-your-own-gem-server) with their wide feature set, come in very handy for usecases like private hosting, mirroring and inter-release builds. With s3 bucket as your gem source, you get convenience of a private gem server, without the hassle of running or maintaining a host. In this guide, we cover steps required for setting up a private gem source using a s3 bucket and configuration for its use with the `gem` command.
> Please check [s3 documentation](https://docs.aws.amazon.com/s3/index.html) if you would like to learn about creating a s3 buckets and their pricing.

## Setting up repo

For a static gem source, you will need 4 additional files beside the `<gemname>.gem` file:
 - `specs.<version>.gz`
 - `latest_specs.<version>.gz`
 - `prerelease_specs.<version>.gz`
 - `quick/Marshal.<version>/<gemname>.gemspec.rz`

You can generate all of them using one command: `gem generate_index`.

    $ mkdir ~/repo && cd ~/repo

    # <gemname>.gem must exist in a directory named `gems`
    $ mkdir gems && wget -P gems/ https://rubygems.org/downloads/rake-12.3.2.gem

    $ gem generate_index --directory .

    # replace bucket1 with name of the bucket you created
    $ aws s3 sync . s3://bucket1


## Use with gem command

You can use your s3 source using `--source` flag:

    $ gem install rake -v 12.3.2 --source s3://<AWS_ACCESS_KEY_ID>:<AWS_SECRET_ACCESS_KEY>@bucket1

Use `.gemrc` if you would like to pre configure multiple s3 sources. It also helps avoid issues related to special characters in the secret key and allows you to specify s3 bucket region.

Add your s3 source under `:sources` key. Each s3 bucket should have its own set of credentials in a hash under `s3_source` key. You can use one of the providers to extract AWS credentials:
 - `env` - [AWS environment variables](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)
 - `instance_profile` - [AWS EC2 Instance Metadata](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html) - will only work on the actual EC2 instance

Or set AWS access id, secret and session token explicitly.

> Note that you need to add `<path_to_gems_dir>` to your s3 source uri, if your gem repo doesn't exist at the root of the bucket.

    $ cat ~/.gemrc
    ....
    :sources:
    - s3://bucket1/
    - s3://bucket2/
    - s3://bucket3/path_to_gems_dir
    - s3://bucket4/
    - https://rubygems.org/
    s3_source: {
      bucket1: {
        provider: "env",
        # region defaults to us-east-1
      },
      bucket2: {
        provider: "instance_profile",
        region: "us-west-2"
      }
      bucket3: {
        id: "AOUEAOEU123123AOEUAO",
        secret: "aodnuhtdao/saeuhto+19283oaehu/asoeu+123h",
        region: "us-east-2"
      },
      bucket4: {
        id: "AOUEAOEU123123AOEUAO",
        secret: "aodnuhtdao/saeuhto+19283oaehu/asoeu+123h",
        security_token: "AQoDYXdzEJr",
        region: "us-west-1"
      }
    }


#### Read more:
[Setting up Travis for inter-release builds](https://simonwo.net/code/gem-server-in-s3/)
