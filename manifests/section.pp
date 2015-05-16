# == Define: xserver::section
#
# Manages a single section in `xorg.conf`
#
# === Parameters
#
# [*section_name*]
#   The name of the `xorg.conf` section. See `man xorg.conf(5)` for valid values.
#
# [*section_entries*]
#   Array of Section Entries to place within the section. 'Strings' are entered verbatim, and hash structures denote a subsection (see example above.)
#
define xserver::section (
    $section_name,
    $section_entries
  ) {
    
    concat::fragment{"${title}-${section_name}":
      content => template('xserver/xserver_xorg_conf_section.erb'),
      target  => $xserver::params::xserver_xorg_conf_file,
    }
  }
