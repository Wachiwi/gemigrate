# gemigrate

This is a simple project that aims to help with the problem to migrate gems from one ruby version to another.
Sure there are smoother ways to achieve the result but I wanted a small binary to do that for me.

Further I wanted to get some experience in writing a crystal CLI app and provision a binary via github.

## Installation

For the installation just download a release and store it inside a folder of your `PATH` variable. After that it should be accessible and fully working.

## Usage

```
$ gemigrate
Usage:
  gemigrate [flags...] <COMMAND> [arg...]

Flags:
  --help (default: false)     # Displays help for the current command.
  --version (default: false)

Arguments:
  COMMAND                     # The sub command to run.

Subcommands:
  backup                      # Generate a gempack of your current local installed gems.
  restore                     # Restore a backup of a old gempack.
```

## Development

To improve or suggest something simply open an issue or submit a PR.

## Contributing

1. Fork it ( https://github.com/wachiwi/gemigrate/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Wachiwi](https://github.com/wachiwi) David Schwarzmann - creator, maintainer
