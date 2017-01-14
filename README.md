# Monorepo Tools
Tools for building and maintaining a monorepo

Currently tested with [https://lernajs.io/](LernaJS) and used to build the [https://github.com/vudash/vudash-core](Vudash) monorepo.

# Setup

Make sure you're using `zsh`. This tool relies on a lot of zsh's powerful functionality.

This tool will only ever run on Linux/Mac/Unix, or other POS*X environments. Not windows. Ain't nobody got time for 'dat!

# Usage

## ./add_to_monorepo.sh

A tool for combining the git history of all the repositories that you want to become part of the monorepo.

To use it, pick an existing repository which will become your monorepo. We'll call this the parent.

If we were going to turn this into a [https://lernajs.io/](LernaJS) monorepo, we'd do the following:

 1. Move all existing files from the parent into a subirectory of the parent called `.tmp`. This is to avoid conflicts from incoming modules.

 Your monorepo should now look like this. Commit it!

  ```
  $ tree -aL 1
  .
  ├── .git
  └── .tmp
  ```

 2. For each repo you want to add, run the `./add_to_monorepo.sh` script:

 `./add_to_monorepo.sh <git-remote-url> <submodule-name>`

 Your repo will now look like:

  ```
  $ tree -aL 2
  .
  ├── .git
  │    └── ...
  └── .tmp
      ├── ...
      └── your-new-submodule
  ```

 3. Keep doing this until your project looks like a monorepo under `.tmp`

  ```
  $ tree -aL 2
  .
  ├── .git
  │    └── ...
  └── .tmp
      ├── module-a
      ├── module-b
      ├── module-c
      ├── module-d
      └── module-e
  ```

 4. You're done. Move all the files from `.tmp` into your root and commit it! Monorepo!

   ```
  $ tree -aL 2
  .
  ├── .git
  │    └── ...
  ├── module-a
  ├── module-b
  ├── module-c
  ├── module-d
  └── module-e
  ```
