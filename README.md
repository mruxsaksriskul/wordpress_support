# chef-wordpresswrapper-cookbook

This cookbook installs the web components for Wordpress.  Nginx, PHP PHP-Fpm, and wordpress.

## Supported Platforms

Supportas Centos 6.X

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['chef-wordpresswrapper']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### chef-wordpresswrapper::default

Include `chef-wordpresswrapper` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-wordpresswrapper::default]"
  ]
}
```

## License and Authors

Author:: Carl Eichhorn, Mike Ruxsaksriskul
# chef-wordpresswrapper
# Chef-Wordpresswrapper
