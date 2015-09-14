#
# Cookbook Name:: chef-wordpress_support
# Attributes:: default
#
# Author:: Carl Eichhorn (<ceichhorn@gannett.com>)
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# In order to update the version, the checksum attribute must be changed too.
# This attribute is in the source.rb file, though we recommend overriding
# attributes by modifying a role, or the node itself.

default['nginx']['version']      = '1.4.4'
default['nginx']['package_name'] = 'nginx'
default['nginx']['dir']          = '/etc/nginx'
default['nginx']['script_dir']   = '/usr/sbin'
default['nginx']['log_dir']      = '/var/log/nginx'
default['nginx']['binary']       = '/usr/sbin/nginx'
default['nginx']['default_root'] = '/var/www/wordpress'
default['apache']['user'] = 'nobody'
default['wordpress']['version'] = 'latest'
default['wordpress']['server_name'] = node['fqdn']
default['wordpress']['parent_dir'] = '/var/www'
default['wordpress']['dir'] = "#{node['wordpress']['parent_dir']}/wordpress"
default['wordpress']['url'] = "https://wordpress.org/wordpress-#{node['wordpress']['version']}.tar.gz"
default['wordpress']['allow_multisite'] = false
default['wordpress']['wp_config_options'] = {
  'UPLOADS' => 'wp-content/uploads'
}
default['wordpress']['db']['root_password'] = 'my_root_password'
default['wordpress']['db']['instance_name'] = 'default'
default['wordpress']['db']['name'] = 'wordpressdb'
default['wordpress']['db']['user'] = 'wordpressuser'
default['wordpress']['db']['pass'] = 'wordpresspass'
default['wordpress']['db']['prefix'] = 'wp_'
default['wordpress']['db']['host'] = 'localhost'
default['wordpress']['db']['port'] = '3306' # Must be a string
default['wordpress']['db']['charset'] = 'utf8'
default['wordpress']['db']['collate'] = ''
default['wordpress']['databag']['site'] = 'vabig'
default['wordpress']['databag']['name'] = 'wordpress'

default['wordpress']['key']['auth'] = 'Nq9=MIM]h8l5a0oZ7Hzq#u%rEx3^S U5zSzR05+_!mc#...GLIE%R|-lf-=ceUzS'
default['wordpress']['key']['secure'] = '+[4(&KgMyEKVk<Sg:JV:VOiby+S,~EP:SZk>Jc*j, fl4tWH-P1w=n;4,W?DL*82'
default['wordpress']['key']['logged'] = ':2.YI~VI+% Ysp&GYQ8).Q]1)~(CDWc({YBp^+1/F]Sw?)0^{0zN$:7uy+vZrC@_'
default['wordpress']['key']['nonce'] = 'd^DEq/T_4[~x^|7f{fbc$-VL{[}q|)QFosS|t;xRVx  /UG3K)X#86pAkTbfP`;_'
default['wordpress']['salt']['auth'] = 'TU=c|gp9Hc2,#@VlmdnS0M|J>o#Q}8K8yd&Q8+t|%JUr+61pC^KTJdpyths|ADen'
default['wordpress']['salt']['secure'] = '^9l%1_~e!FJUfP<)(^C*7/7tU3_{%xx8+HxH[-!w?a>0J^Ox-+YYF ~ue2,@Z}){'
default['wordpress']['salt']['logged'] = '|RS`rH(4KSF?1ky];yqb/f^T_f~zD@eIY>$2v`|vJp/,Te9tR^^Wzy#Uc;h#,yF{'
default['wordpress']['salt']['nonce'] = '6A*|POAGB(=f:v9k[paZa|IfN2n(e]u`z;~8~[+xcO[[dNM~->8+dVf]Y%&zn,c^'

case node['platform_family']
when 'debian'
  default['nginx']['user']       = 'www-data'
  default['nginx']['init_style'] = 'runit'
when 'rhel', 'fedora'
  default['nginx']['user']        = 'apache'
  default['nginx']['init_style']  = 'init'
  default['nginx']['repo_source'] = 'epel'
when 'gentoo'
  default['nginx']['user']       = 'nginx'
  default['nginx']['init_style'] = 'init'
when 'freebsd'
  default['nginx']['package_name'] = 'www/nginx'
  default['nginx']['user']         = 'www'
  default['nginx']['dir']          = '/usr/local/etc/nginx'
  default['nginx']['script_dir']   = '/usr/local/sbin'
  default['nginx']['binary']       = '/usr/local/sbin/nginx'
  default['nginx']['default_root'] = '/usr/local/www/nginx-dist'
else
  default['nginx']['user']       = 'www-data'
  default['nginx']['init_style'] = 'init'
end

default['nginx']['upstart']['runlevels']     = '2345'
default['nginx']['upstart']['respawn_limit'] = nil
default['nginx']['upstart']['foreground']    = true

default['nginx']['group'] = node['nginx']['user']

default['nginx']['pid'] = '/var/run/nginx.pid'

default['nginx']['gzip']              = 'on'
default['nginx']['gzip_static']       = 'off'
default['nginx']['gzip_http_version'] = '1.0'
default['nginx']['gzip_comp_level']   = '2'
default['nginx']['gzip_proxied']      = 'any'
default['nginx']['gzip_vary']         = 'off'
default['nginx']['gzip_buffers']      = nil
default['nginx']['gzip_types'] = %w(
  text/plain
  text/css
  application/x-javascript
  text/xml
  application/xml
  application/rss+xml
  application/atom+xml
  text/javascript
  application/javascript
  application/json
  text/mathml
)
default['nginx']['gzip_min_length']   = 1_000
default['nginx']['gzip_disable']      = 'MSIE [1-6]\.'

default['nginx']['keepalive']            = 'on'
default['nginx']['keepalive_timeout']    = 65
default['nginx']['worker_processes']     = node['cpu'] && node['cpu']['total'] ? node['cpu']['total'] : 1
default['nginx']['worker_connections']   = 1_024
default['nginx']['worker_rlimit_nofile'] = nil
default['nginx']['multi_accept']         = false
default['nginx']['event']                = nil
default['nginx']['server_tokens']        = nil
default['nginx']['server_names_hash_bucket_size'] = 64
default['nginx']['sendfile'] = 'on'

default['nginx']['access_log_options']     = nil
default['nginx']['error_log_options']      = nil
default['nginx']['disable_access_log']     = false
default['nginx']['install_method']         = 'package'
default['nginx']['default_site_enabled']   = true
default['nginx']['types_hash_max_size']    = 2_048
default['nginx']['types_hash_bucket_size'] = 64

default['nginx']['proxy_read_timeout']      = nil
default['nginx']['client_body_buffer_size'] = nil
default['nginx']['client_max_body_size']    = nil
default['nginx']['default']['modules']      = []
