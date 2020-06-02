require 'rails_helper'

describe ApplicationHelper do
  describe '#format_name' do
    it 'return an empty string when an empty string is name' do
      expect(format_name('')).to eq('')
    end

    it 'return an empty string when name is nil' do
      expect(format_name(nil)).to eq('')
    end

    it 'returns the first letter of numerous words capitalized' do
      expect(format_name('mr. Jon doe')).to eq('Mr. Jon Doe')
    end

    it 'returns the fist letter capitalized and the rest lower case' do
      expect(format_name('mR. jON DOE')).to eq('Mr. Jon Doe')
    end
  end

  describe '#format_string' do
    it 'returns an empty string when nothing is given' do
      expect(format_string(nil)).to eq('')
    end

    it 'returns the string capitalized with leading and trailing white space trimmed' do
      expect(format_string(' hello world   ')).to eq('Hello world')
    end

    it 'with multiple strings it returns the first word capitalized and all leading and traling spaces stripped' do
      expect(format_string(' hello world. This is a test   ')).to eq('Hello world. This is a test')
    end
  end
end
