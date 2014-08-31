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
    <td><tt>['recpt1']['kernel_version']</tt></td>
    <td>String</td>
    <td>`uname -r`</td>
    <td><tt>3.2.0-4-amd64</tt></td>
  </tr>
</table>

Usage
-----
#### recpt1::default
Just include `recpt1` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[recpt1]"
  ]
}
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
