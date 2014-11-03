# designate-postfix-cookbook

The writeup by jtimberman at http://jtimberman.housepub.org/blog/2011/08/06/encrypted-data-bag-for-postfix-sasl-authentication/
assumes you can hack on the community cookbook's recipes/templates.  Lets not.

This cookbook serves to allow you to put `[:postfix][:sasl][:smtp_sasl_user_name]`
and `[:postfix][:sasl][:smtp_sasl_passwd]` into an encrypted data bag
(`Chef::EncryptedDataBagItem.load("secrets","postfix")`).

This approach uses the wrapper cookbook approach to override.

Scope of this cookbook was to allow products to use the `mailgun` API 
but put their SASL bits into encrypted data bags.

## Supported Platforms

All of them?

## Usage

### designate-postfix::default

Include `designate-postfix` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[designate-postfix::default]"
  ]
}
```

Have an encrypted data bag called `secrets` with a item called `postfix`.  In
that data bag, set `user` and `passwd`.  Should be all you need.

This recipe should call the dependent postfix recipes with overrides.

## License and Authors

Author:: Rackspace <dnsaas@rackspace.com>
