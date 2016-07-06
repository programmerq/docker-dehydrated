# Docker image for letsencrypt.sh and lexicon

See https://github.com/lukas2511/letsencrypt.sh and https://github.com/AnalogJ/lexicon

I created this image to make it easy to generate and maintain letsencrypt
certificates using letsencrypt.sh's support for the dns-01 verification method,
combined with lexicon since it handles so many DNS providers.

## Basic Usage

This will run the letsencrypt.sh script without a configuration file.
`$PROVIDER` is used by lexicon.letsencrypt.sh to determine which provider to
call lexicon with. `$LEXICON_*` variables set the credentials for lexicon to
talk to the DNS provider. `/letsencrypt.sh/certs` is the directory where
certificates will actually be stored.

    docker run --rm -it \
           -e PROVIDER="cloudflare" \
           -e LEXICON_CLOUDFLARE_USERNAME='user@example.com' \
           -e LEXICON_CLOUDFLARE_TOKEN=`123456789012345678901234567890123456` \
           -v `pwd`/certs:/letsencrypt.sh/certs \
           programmerq/letsencrypt.sh -c -d test.example.com -t dns-01 -k /lexicon.letsencrypt.sh


## More advanced usage

You can take advantage of the letsencrypt.sh domains.txt and config file (See
example here:
https://github.com/lukas2511/letsencrypt.sh/blob/194d543fa11ba5bc8501df532b97728726a3caec/docs/examples/config)


    mkdir certs
    echo test.example.com > certs/domains.txt

