require 'spec_helper'
describe 'etchosts' do

  context 'with defaults for all parameters' do
    it { should contain_class('etchosts') }
  end
end
