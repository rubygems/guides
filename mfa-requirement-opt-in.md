---
layout: default
title: MFA requirement opt-in
url: /mfa-requirement-opt-in
previous: /using-mfa-in-command-line
next: /using-s3-source
---
<em class="t-gray">How to opt-in for MFA requirement.</em>

You can make your gems more secure by requiring all owners to enable MFA on their account.

## Opt-in to MFA requirement

You can opt-in a gem you are managing by releasing a version that has
`metadata.rubygems_mfa_required` set to `true`.

    % cat hola.gemspec
    Gem::Specification.new do |s|
    ...
    s.metadata       = { "rubygems_mfa_required" => "true" }
    ...
    end

The version being released with `rubygems_mfa_required` set and all the following versions
will require you to have MFA enabled.
Once enabled, the gem page will show `NEW VERSIONS REQUIRE MFA` in the sidebar, and all versions published with `rubygems_mfa_required` set will also show `VERSION PUBLISHED WITH MFA`:
    ![MFA status indicators](/images/mfa-required-since.png){:class="t-img t-img--small"}

You will see the following error message if you have not enabled MFA and you are trying to release
a new version for a gem that requires MFA:

    $ gem push hola-1.0.0.gem
    Pushing gem to https://rubygems.org...
    Rubygem requires owners to enable MFA. You must enable MFA before pushing new version.

## Disabling MFA requirement

You can disable the MFA requirement by setting `rubygems_mfa_required` to `"false"` or any [`ActiveRecord::Type::Boolean::FALSE_VALUES`](https://api.rubyonrails.org/classes/ActiveModel/Type/Boolean.html).

**Note:** We will enforce the MFA requirement on the version being published. MFA requirement will be disabled after you have successfully
published a gem with rubygems_mfa_required set to false.
