SEARCH STANDARD SEARCH   
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

When a custom search type is active in the SearchRepeat.vim ([vimscript #4949](http://www.vim.org/scripts/script.php?script_id=4949))
plugin, the plain normal search can be restored by typing '/<Enter>'. This
script adds and registers mappings to perform only one normal search (without
repeating that) or to completely reactivate the normal search via go/ and
gO/ (and go? as a synonym for the latter).

### SEE ALSO

- Check out the SearchRepeat.vim plugin page ([vimscript #4949](http://www.vim.org/scripts/script.php?script_id=4949)) for a full
  list of custom searches that integrate with it.

USAGE
------------------------------------------------------------------------------

    The special searches all start with 'go...' (mnemonic: "go once to special
    match"); and come in search forward (go...) and backward (gO...) variants.

    [count]go/ / gO/, go?   Search forward / backward to the [count]'th occurrence
                            of the last search pattern (plain normal search).

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-SearchStandardSearch
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim SearchStandardSearch*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.2 or higher.
- Requires the SearchRepeat.vim plugin ([vimscript #4949](http://www.vim.org/scripts/script.php?script_id=4949)), version 2.00 or
  higher.

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:
configvar

plugmap

INTEGRATION
------------------------------------------------------------------------------

If the SearchRepeat plugin is installed, a parallel set of "go now and for
next searches" mappings (starting with 'gn...' instead of 'go...') is
installed. These mappings have the same effect, but in addition re-program the
'n/N' keys to repeat this particular search (until another gn... search is
used).

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-SearchStandardSearch/issues or email (address
below).

HISTORY
------------------------------------------------------------------------------

##### GOAL
First published version.

##### 0.01    03-Jul-2009
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2009-2017 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat <ingo@karkat.de>
