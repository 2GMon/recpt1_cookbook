recpt1 Cookbook
========================
This cookbook set up recpt1.

Requirements
------------
#### platforms
- `Debian` - This cookbook is tested with only debian-7.6.

Attributes
----------
#### recpt1::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['arib25']['rev']</tt></td>
    <td>String</td>
    <td>arib branch revision</td>
    <td><tt>ec7c87854f2f</tt></td>
  </tr>
  <tr>
    <td><tt>['recpt1']['rev']</tt></td>
    <td>String</td>
    <td>recpt1 latest branch revision</td>
    <td><tt>c8688d7d6382</tt></td>
  </tr>
</table>

Usage
-----
#### recpt1::default
include `recpt1` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[recpt1]"
  ]
}
```

#### run test
```
bundle install
bundle exec kitchen test
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 2GMon
