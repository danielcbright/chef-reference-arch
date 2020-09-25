default['attributes-loader']['dbags'] = ['global', 'ymir', node.policy_name]
default['waivers']['file_location'] = '/opt/chef/waivers.yml'
default['waivers']['controls'] = {
  "my_waiver_1": {
    "expiration_date": '2020-10-08',
    "run": true,
    "justification": 'Setting max days for 20 for local testing'
  },
  "my_waiver_2": {
    "expiration_date": '2020-10-08',
    "run": true,
    "justification": 'Setting max days for 20 for local testing'
  }
}
default['waivers']['controls_to_remove'] = [
  "fake_waiver"
]