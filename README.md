# xserver

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with xserver](#setup)
    * [What xserver affects](#what-xserver-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with xserver](#beginning-with-xserver)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module to manage the installation and configuration of Xorg's X Server.

## Module Description

The X.Org project provides an open source implementation of the X Window System.

This module manages the installation and configuration of the Xorg X Window Server. This module does not manage the X Server service. See the wilrnh-xdm module for that.

## Setup

### What xserver affects

- X Server package
- X server configuration - xorg.conf

### Beginning with xserver

To get started with the X server with default configurations, simply include the module in your manifest:

```puppet
include ::xserver
```

This will install the Xorg X Server, and install an empty `xorg.conf`, which should make X use its defaults. To o setup a working `xorg.conf`, a a bunch of sections, eg.,:

```puppet
xserver::section{'Layout0':
  section_name => 'ServerLayout'
  section_entries => [
    'Identifier "Layout0"', # section entry
    'Screen 0  "Screen0"',
    'InputDevice "Keyboard0" "CoreKeyboard"',
    'InputDevice "Keyboard0" "CoreKeyboard"',
    {'Display' => [ # subsection
      'Virtual 1280 1024',
      'Depth 24'
    ]}
  ]
}
```

## Usage

## Reference

### Public Classes

`xserver`: Initializes X Server installation and configuration.

### Defined types

`xserver::section`: Manages a single section in `xorg.conf`

### Parameters

##### ::xserver

`package_ensure`: Passed directly to the `ensure` attribute of the `package` type. Defaults to 'present'.

##### ::xserver::section

`section_name`: The name of the `xorg.conf` section. See `man xorg.conf(5)` for valid values.

`section_entries`: Array of Section Entries to place within the section. 'Strings' are entered verbatim, and hash structures denote a subsection (see example above.)

## Limitations

This module supports Ubuntu Trusty, RHEL 5, 6 and 7, and CentOS 5, 6 and 7.

## Development

Pull requests are always awesome.
