# THIS PROJECT IS NOWHERE NEAR READY FOR USE, COME BACK LATER. 

# Modulus

Modulus allows you to validate bank account numbers (UK ones specifically), using the MOD10, MOD11 and Double Alternative check algorithms and data freely provided by VocaLink, see related links below for more information.

The data is imported into Redis with the commands provided, and can be updated with files from VocaLink in their existing format.  All you have to do is download them and run the import scripts, you should always import both the weighting and substitute tables when updating your data.

Caveats:
* Just because an account is valid doesn't mean that it is in use.
* ~~If an account belongs to a financial institution not listed by VocaLink it is assumed to be valid as per their specification.~~
* An account that cannot be found will raise a SortcodeNotFound exception, which you can handle as you wish.

## Installation

Add this line to your application's Gemfile:

    gem 'modulus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install modulus

## Usage

```ruby
valid = Modulus.check('######', '########')
```

## Commandline Interface (for imports)

```bash
modulus
  -r  --redis [host:port]
  -w  --weight-table [file]
  -s  --substitute-table [file]
```

## Related Links

* [VocaLink](http://www.vocalink.com/products/payments/customer-support-services/modulus-checking.aspx)
* [VocaLink Modulus Weight Tables](http://www.vocalink.com/media/367059/valacdos.txt)
* [VocaLink Sortcode Substitute Tables](http://www.vocalink.com/media/300584/scsubtab.txt)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

