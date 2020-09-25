# InSpec test for recipe ymir-cache::default

# Test ymir-cache specific stuff
input('vm.overcommit_memory', value: 1)

control 'kernel-parameters' do
  title 'Test ymir-cache kernel parameters'
  desc 'Kernel parameter values should equal what they are expected to equal'
  impact 1.0

  describe kernel_parameter('vm.overcommit_memory') do
    its('value') { should eq 1 }
  end
end