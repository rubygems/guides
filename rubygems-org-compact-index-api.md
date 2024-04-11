---
layout: default
title: RubyGems.org Compact Index API
url: /rubygems-org-compact-index-api
previous: /rubygems-org-api-v2
next: /rubygems-org-rate-limits
---
<em class="t-gray">Details of the Compact Index API used for Bundler dependency resolution</em>

Compact Index API
-----------------

The Compact Index API is considered a stable public API.

The primary index file is the `versions` file, which provides the name, versions and the MD5 checksum of each rubygem `info` file.

If you need to collect all info about all rubygems, please use the [public data dumps](https://rubygems.org/pages/data) of the rubygems.org database.

### Fetching and Caching

Example Response (with some headers ignored):

    $ curl -I https://rubygems.org/info/bundler

    HTTP/2 200
    last-modified: Fri, 22 Mar 2024 13:09:59 GMT
    etag: "40148273a7c7cd16b49d00a9935fd445"
    cache-control: max-age=60, public
    content-type: text/plain; charset=utf-8
    repr-digest: sha-256="pf7Ts7NTRac//JxO9ke3IYbcWx8kcVn9N0mbm5EJpP0="
    accept-ranges: bytes

All compact index endpoints support ETags with the `If-None-Match` header.

    If-None-Match: "40148273a7c7cd16b49d00a9935fd445"

The compact index is designed to be fetched using the HTTP `Range` header.
When a previously fetched copy is present, a ranged request to take advantage of the appended line pattern.

    Range: bytes=#{range_start}-

Responses from the `/versions` and `/info/[GEM]` endpoints will include the `Repr-Digest` header.
The digests will have at least the SHA256 checksum of the entire file whether the response includes the full file or a partial response.
*Please note that a `Digest` header is present, but it is deprecated and may be removed without notice.*

When the Range header is satisfied, append the contents at exactly the starting byte, then compute the SHA256 checksum of the resulting file.
If the result matches the `Repr-Digest` header's SHA256 checksum, the file is considered complete and up-to-date.

Each line in the `/versions` file includes the latest MD5 calculation of the matching `/info` file for that rubygem at the time the line was written.
The latest MD5, closest to the end of the file, will match the MD5 of the up-to-date `/info` file.

Exact implementation details are available in the [Bundler CompactIndexClient::Updater](https://github.com/rubygems/rubygems/blob/master/bundler/lib/bundler/compact_index_client/updater.rb).

### GET - `/versions`

Returns a custom text based format containing information about all versions of all rubygems.

This API endpoint is intended to be a compact index of all possible rubygem versions.
When new rubygems or rubygems versions are added or when a rubygem is yanked, it is added to the end of the file using the format detailed below.

The file is append only during the month which improves caching performance.
It is recalculated at the start of each month, removing yanked rubygems and compressing new versions into one line for each rubygem.

*Warning: this is a big file. Example is truncated.*

    $ curl https://rubygems.org/versions
    
    created_at: 2024-04-01T00:00:05Z
    ---
    - 1 05d0116933ba44b0b5d0ee19bfd35ccc
    -A 0.0.0 8b1527991f0022e46140907a7fc4cfd4
    .cat 0.0.1 631fd60a806eaf5026c86fff3155c289
    .omghi 1,2 7a67c0434100c2ab635b9f4865ee86bd
    0mq 0.1.0,0.1.1,0.1.2,0.2.0,0.2.1,0.3.0,0.4.0,0.4.1,0.5.0,0.5.1,0.5.2,0.5.3 6146193f8f7e944156b0b42ec37bad3e
    [...SNIP...]
    active_model_serializers -0.9.10 7ad37af4aec8cc089e409e1fdec86f3d
    active_model_serializers 0.9.11 a6d40e97b289ee6c806e5e9f7031623b
    openapi_first 1.4.1 40fbfdebcbfee3863df697e1d641f637

#### `versions` File Format

The format of the `versions` file uses one line per rubygem at computation time, with additional lines appended to the end that may include new or yanked versions of a rubygem already present earlier in the file.

The lines preceeding `---` should be considered opaque metadata.

    created_at: 2024-04-01T00:00:05Z
    --- 

Each following line gives information about 1 rubygem with the format:

    RUBYGEM [-]VERSION_PLATFORM[,VERSION_PLATFORM],...] MD5

The parts of this line are as follows:

1. **`RUBYGEM`** - The name of the rubygem.
2. **`(SPACE)`** - The space character.
3. **`[(MINUS)]`** - (optional) The `-` (minus) character. Only present if the version following it has been yanked since the `versions` file was last recalculated.
4. **`VERSION_PLATFORM`** - A rubygem VERSION wich may include the PLATFORM. This combined format is described in more detail in the `info` file format section.
5. **`[(COMMA)VERSION]`** - (optional) A `,` (comma) character, indicating that another VERSION will follow. Read comma delimited VERSION chunks until a space is encountered.
6. **`(SPACE)`** - The space character.
7. **`MD5`** - The MD5 of the rubygem "info" file, described below. Only the *last* MD5 for a gem name in the `versions` file should be considered accurate for the related info file.

For more detail, see [the parser in Bundler](https://github.com/rubygems/rubygems/blob/master/lib/rubygems/resolver/api_set/gem_parser.rb).

### GET - `/info/<RUBYGEM>`

Returns a custom text based format for the single rubygem named by `<RUBYGEM>` with a line for each version of the rubygem.

*Example is truncated.*

    $ curl https://rubygems.org/info/rails

    ---
    2.2.2 actionmailer:= 2.2.2,actionpack:= 2.2.2,activerecord:= 2.2.2,activeresource:= 2.2.2,activesupport:= 2.2.2,rake:>= 0.8.3|checksum:84fd0ee92f92088cff81d1a4bcb61306bd4b7440b8634d7ac3d1396571a2133f
    2.3.2 actionmailer:= 2.3.2,actionpack:= 2.3.2,activerecord:= 2.3.2,activeresource:= 2.3.2,activesupport:= 2.3.2,rake:>= 0.8.3|checksum:ac61e0356987df34dbbafb803b98f153a663d3878a31f1db7333b7cd987fd044
    2.0.5 actionmailer:= 2.0.5,actionpack:= 2.0.5,activerecord:= 2.0.5,activeresource:= 2.0.5,activesupport:= 2.0.5,rake:>= 0.7.2|checksum:5e8a6e36f2537b795b7bb237e2aea18a166349e1e54e463a64beba5ae84cd406
    [...SNIP...]
    7.0.8.1 actioncable:= 7.0.8.1,actionmailbox:= 7.0.8.1,actionmailer:= 7.0.8.1,actionpack:= 7.0.8.1,actiontext:= 7.0.8.1,actionview:= 7.0.8.1,activejob:= 7.0.8.1,activemodel:= 7.0.8.1,activerecord:= 7.0.8.1,activestorage:= 7.0.8.1,activesupport:= 7.0.8.1,bundler:>= 1.15.0,railties:= 7.0.8.1|checksum:7deb37884ac5e9afeaeb6ad503c56e819f68e53746d621b2187322f874ba2ded,ruby:>= 2.7.0,rubygems:>= 1.8.11
    7.1.3.1 actioncable:= 7.1.3.1,actionmailbox:= 7.1.3.1,actionmailer:= 7.1.3.1,actionpack:= 7.1.3.1,actiontext:= 7.1.3.1,actionview:= 7.1.3.1,activejob:= 7.1.3.1,activemodel:= 7.1.3.1,activerecord:= 7.1.3.1,activestorage:= 7.1.3.1,activesupport:= 7.1.3.1,bundler:>= 1.15.0,railties:= 7.1.3.1|checksum:73aa0775e7dc698cebad542de2eea6d5b62957290e6a23a96e915281df36f026,ruby:>= 2.7.0,rubygems:>= 1.8.11
    7.1.3.2 actioncable:= 7.1.3.2,actionmailbox:= 7.1.3.2,actionmailer:= 7.1.3.2,actionpack:= 7.1.3.2,actiontext:= 7.1.3.2,actionview:= 7.1.3.2,activejob:= 7.1.3.2,activemodel:= 7.1.3.2,activerecord:= 7.1.3.2,activestorage:= 7.1.3.2,activesupport:= 7.1.3.2,bundler:>= 1.15.0,railties:= 7.1.3.2|checksum:2d787a65e87b70ee65f9d1cb644aaa5bb80eea12298982f474da949772c1bfa0,ruby:>= 2.7.0,rubygems:>= 1.8.11

#### `info` File Format

The format of the `info` file uses one line per version.
When a new version is added, additional lines are appended to the end of the file.

When a version is yanked, the `info` file is recalculated.
The file will never list a version as yanked. It will only be excluded from the file.

Any lines preceeding `---` should be considered opaque.

    ---

Each following line gives information about 1 version of a rubygem with the format:

    VERSION[-PLATFORM] [DEPENDENCY[,DEPENDENCY,...]]|REQUIREMENT[,REQUIREMENT,...]

The pieces of each line are:

1. **`VERSION`** - The version of the rubygem. Read VERSION until either `-` (minus) or space character is encountered.
2. **`[-PLATFORM]`** - The platform, if it is not the default platform `ruby`. The first `-` (minus) character in the `VERSION[-PLATFORM]` chunk splits the VERSION and PLATFORM. The PLATFORM may contain more dashes. Read platform until a space is encountered.
3. **`(SPACE)`** - The space character.
4. **`[DEPENDENCY]`** - (optional) A dependency is another rubygem required by this gem. DEPENDENCY may contain spaces. See below for format.
5. **`[(COMMA)DEPENDENCY]`** - (optional) A `,` (comma) character, indicating that another DEPENDENCY will follow. Read comma delimited DEPENCENCY chunks until the `|` (pipe) character is encountered.
6. **`(PIPE)`** - The `|` (pipe) character.
7. **`REQUIREMENT`** - Additional requirements for the rubygem, which always includes at least the SHA256 checksum. REQUIREMENT may contain spaces. See below for format.
8. **`[(COMMA)REQUIREMENT]`** - (optional) A `,` (comma) character, indicating that another REQUIREMENT will follow. Read comma delimited REQUIREMENT chunks until the end of the line.

**`DEPENCENCY` Format**

Examples:

    actionmailer:= 2.2.2
    parser:>= 3.2.2.3
    rainbow:< 4.0
    unicode-display_width:< 3.0&>= 2.4.0
    rack:~> 1.0
    tilt:!= 1.3.0&~> 1.1

Format:

    GEM:CONSTRAINT[&CONSTRAINT]

1. **`RUBYGEM`** - The rubygem depended on.
2. **`(COLON)`** - The `:` (colon) character.
3. **`CONSRAINT`** - A version constraint. An OPERATOR in `[=, >, <, >=, <=, ~>, !=]` then an (optional) space character, then a VERSION.
4. **`[(AMPERSAND)CONSTRAINT]`** - A `&` (ampersand) character, indicating that an additional CONSTRAINT follows relating to the same GEM. Read ampersand delimited CONSTRAINT chunks until the `,` (comma) character is encountered.

**`REQUIREMENT` Format**

The REQUIREMENT chunk will always contain the `checksum` key. The `ruby` and `rubygems` keys are like a CONSTRAINT above, indicating a required ruby or rubygems version.

The `checksum` is the SHA256 checksum of the `GEM-VERSION-PLATFORM.gem` file originally uploaded to rubygems.org. The SHA256 computed from the matching downloaded `.gem` file must match this checksum or the `.gem` must be considered corrupted.

Examples:

    checksum:2c4af8d4a65ac5290445bfe7582be4490162d6934f49d76858b55647b4c4428d
    ruby:< 3.3.dev&>= 2.7
    rubygems:>= 1.8.11

Format:

    KEY:VALUE

1. **`KEY`** - An alphanumeric key.
2. **`(COLON)`** - A `:` (colon) character.
3. **`VALUE`** - The value of the key. The VALUE must not contain `,` (comma) or `:` (colon) characters.

### GET - `/names`

Returns a custom text based format of all rubygem names, with one rubygem name per line.

*The API is not currently used by any official rubygems tools. The order may be subject to change. Example is truncated.*

    $ curl https://rubygems.org/names

    ---
    _
    -
    0mq
    0xdm5
    [...SNIP...]

#### `names` File Format

The format of the `names` file is a simple newline delimited list of rubygem names.

Any lines preceeding `---` should be considered opaque.

    ---

Each following line consists only of a rubygem name:

    RUBYGEM

The parts of this line are as follows:

1. **`RUBYGEM`** - The name of the rubygem.