require 'spec_helper'
describe 'xserver' do

  context 'with defaults for all parameters' do
    it { should contain_class('xserver') }
  end
end
