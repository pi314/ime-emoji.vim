===============================================================================
ime-emoji
===============================================================================
An emoji input plugin for `pi314/ime.vim <https://github.com/pi314/ime.vim>`_

This plugin is a embedded plugin.


Installation
-------------------------------------------------------------------------------
After installation, please add ``'emoji'`` to ``g:ime_plugins`` ::

  let g:ime_plugins = ['emoji']


Usage
-------------------------------------------------------------------------------
* After typing emoji name, press ``<space>`` to trigger completion.
* ``:pudding:`` geneartes ``🍮`` character.
* ``:`` generates the prefixes of all available emoji names.
* ``:pu`` generates all available emoji names with prefix ``:pu``.
