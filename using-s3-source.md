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

Use `.gemrc` if you would like to pre configure multiple s3 sources. It also helps avoid issues related to special characters in the secret key.

Add your s3 source under `:sources` key. AWS access id and secret per s3 source can be set with a hash under `s3_source` key.
> Note that you need to add `<path_to_gems_dir>` to your s3 source uri, if your gem repo doesn't exist at the root of the bucket.

    $ cat ~/.gemrc
    ....
    :sources:
    - s3://bucket1/
    - s3://bucket2/path_to_gems_dir
    - https://rubygems.org/
    s3_source: {
      bucket1: {
        id: "AOUEAOEU123123AOEUAO",
        secret: "aodnuhtdao/saeuhto+19283oaehu/asoeu+123h"
      },
      bucket2: {
        id: "AOUEAOEU123123AOEUAO",
        secret: "aodnuhtdao/saeuhto+19283oaehu/asoeu+123h"
      }
    }


#### Read more:
[Setting up Travis for inter-release builds](https://simonwo.net/code/gem-server-in-s3/)
