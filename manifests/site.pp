# minimalist but expandable site.pp
#
# The general idea is that the very first time a node runs, it runs via the default node definition
# after that, it runs with a definition matching its fqdn
#

node default { hiera_include('modules::default_node') }

node 'dev1.ec2.internal' { hiera_include('modules::web_node') }
